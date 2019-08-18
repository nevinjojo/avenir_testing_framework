## Avenir Testing Framework 2.0
New and Updated Testing Framework for User Interface Testing at Avenir Tech!

### Installation
You can install the framework by executing the `install` file in the root directory:
```
$ ./install
```

#### **What the installation file does:**
- create directories to store scripts, screenshot, and result files
- Install Homebrew if not already installed (assuming you are using Mac. If not try installing Linuxbrew)
- Install YAML
- Install Ruby
- Install Chromedriver
- Install Selenium WebDriver Ruby Gem (if not already installed)

**Note:** If one of the installation filed, try manually installing them. Make sure that the version of the installation matches the version specified in `install` file.

### Usage
To run the framework you need at least one test script (int he format of `.txt`). Check out the commands that you can execute in the test script in the Commands section.
You can execute the test script by executing the `run` file in the root directory:
```
./run
```

#### Framework execution argument options
**Specify test script(s)**
The run file accepts a range of flags and arguments (most of them optional). To run the script stored inside `testFile.txt` in the scripts directory, run the following command:
```
./run scripts/testFile.txt
```

You can either run a single script like mentioned above or recursively run an entire directory of test suite(s) by simple mentioning the directory:
```
./run scripts/
```

You can also use the `-s` flag to specify the test script(s):
```
./run -s scripts/testFile.text
```

**Specify results directory**
You can use the `-d` flag to specify the directory where the results will be stored:
```
./run -d results/path/to/results/dir/ scripts/testFile.txt
```
This will create a directory (with the current timestamp) and store the results in that directory. If results directory is not specified it will default to `results/` directory to store the results.

**Specify test browser**
`-b` flag will allow you to specify the test browser (`chrome|safari|firefox|iexplorer`). Default browser is Chrome
```
./run -b chrome scripts/testFile.txt
```

**Set results directory to Dropbox**
This is so that the results can be accessed from multiple devices. You will need to check/change the path/to/dropbox in run file underneath -p option. 
```
./run -p scripts/testFile.txt
```

**Note:** Make sure that you specify the test script(s) at the ned of the command like the examples given above. This is because the flags need to be set before specifying the test scripts.

#### Test script command options
| Command | Example | Description |
|---------|---------|-------------|
| `test` | `test Custodian trans 01` | Initialises a new test with new Title. Resets previous session history |
| `description` | `description CUST USD transaction 01` | Records the purpose of each test |
| `#` | `# this is a test related commnet` | Anything after `#` is considered as a comment |
| `output` | `output` | Sets a new output file to write the test results to |
| `goto` | `goto url` or `goto dev` | Navigate to the specified url. URL can also be a YAML variable such as `dev`|