#!/usr/bin/perl -w

use strict;
use warnings;

use 1.10.1;

use DateTime;
use POSIX;
use List::MoreUtils qw(first_index);

my $in = shift;
my $file = 0;

if ( !$in || $in eq '--help')
{
    printf << "EOF";
Usage:
    idCheck.pl [any eleven digits] – provides the final checksum digit for the id
    
    idCheck.pl [path/to/file.txt] – reads lines of 12 characters and verifies them as valid kazakh ids

Structure:
    [xx][xx][xx][x][xxxx][x]
     |   |   |   |  |     ﹂checksum (0-9, depends on previous)
     |   |   |   |  ﹂BOJ (any set of 4 digits for now)
     |   |   |   ﹂generation & gender (1-6)
     |   |   ﹂day (00-31)
     |   ﹂month (01-12)
     ﹂year (00-99)
EOF

    exit;
}

my @list;
if ( -e $in)
{
    printf "file mode \n";
    $file = 1;
    open (my $fh, '<:encoding(UTF-8)', $in) or die "Could not open file $in, $!";

    my $idcol;
    while (my $row = <$fh>)
    {
        my @ln = split(',', $row);
        print ref @ln;
        if (! defined $idcol || $idcol < 0)
        {
            $idcol = first_index {$_ eq 'ID number*'} @ln;
        }
        else
        {
            last if ($ln[$idcol] eq "");
            push @list, $ln[$idcol];
        }
    }

    close ($fh);
}
else
{
    printf "checkgen mode \n";
    @list = ($in);
}

foreach my $base (@list)
{
    my $fail = 0;
    print "$base -- ";
    if (! $base)
    {
        printf "err: please provide the first 11 chars of the id\n";
        $fail = 1;
    }
    elsif (!$file && length($base) != 11)
    {
        printf "err: base must be 11 chars long\n";
        $fail = 1;
    }
    elsif ($file && length($base) != 12)
    {
        printf "err: base must be 12 chars long\n";
        $fail = 1;
    }
    elsif ($base =~ /\D/)
    {
        printf "err: base must contain only numbers\n";
        $fail = 1;
    }
    elsif (substr($base, 6, 1) > 6)
    {
        printf "err: generation/gender check digit too high\n";
        $fail = 1;
    }
    elsif (substr($base, 6, 1) == 0)
    {
        printf "err: generation/gender check digit too low\n";
        $fail = 1;
    }
    
    eval
    {
        my $dt = DateTime->new(
            year => (floor((substr($base,6,1) -1) / 2) * 100) + 1800 + substr($base,0,2),
            month => substr($base, 2, 2),
            day => substr($base, 4, 2)
        );
    };
    
    if ($@)
    {
        printf "err: initial YYMMDD invalid\n";
        $fail = 1;
    }
    
    if (!$fail)
    {
        for my $check (0..9)
        {
            my $s = 0;
            
            for my $i (0..10)
            {
                $s += ($i + 1) * substr($base, $i, 1);
            }
            
            my $k = $s % 11;
            
            if ($k == 10)
            {
                $s = 0;
                for my $i (0..10)
                {
                    my $t = ($i + 3) % 11;
                    
                    if ($t == 0)
                    {
                        $t = 11;
                    }
        
                    $s += $t * substr($base, $i, 1);
                }
                $k = $s % 11;
        
                next if ($k == 10);
            }
            next if ($k != $check);
        
            if ($file)
            {
                print "valid\n";
            }
            else
            {
                printf "checksum %s valid, final id: %s%s\n", $check, $base, $check;
            }
        }
    }
}
