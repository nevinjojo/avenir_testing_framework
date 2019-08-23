## Avenir Testing Framework 2.0
New and Updated Testing Framework for User Interface Testing at Avenir Tech!

**Current Maintainer:** [@nevinjojo](https://github.com/nevinjojo)

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
- Install Codacy Coverage to test framework coverage (You might need to sudo privilege for this)

**Note:** If one of the installation filed, try manually installing them. Make sure that the version of the installation matches the version specified in `install` file.

### Usage
To run the framework you need at least one test script (int he format of `.txt`). Check out the commands that you can execute in the test script in the Commands section.
You can execute the test script by executing the `run` file in the root directory:
```
$ ./run
```

### File Structure (after successful installation)
```
.
├── README.md
├── execs
│   ├── execution files
├── id_checks
│   ├── id_check files
├── install
├── lib
│   ├── framework specific files
├── main.rb
├── results
│   ├── result files
├── run
├── screenshots
│   ├── screenshot files
├── scripts
│   ├── all tes scripts
└── system_details.yml
```

#### Framework execution argument options
**Specify test script(s)**
The run file accepts a range of flags and arguments (most of them optional). To run the script stored inside `testFile.txt` in the scripts directory, run the following command:
```
$ ./run scripts/testFile.txt
```

You can either run a single script like mentioned above or recursively run an entire directory of test suite(s) by simple mentioning the directory:
```
$ ./run scripts/
```

You can also use the `-s` flag to specify the test script(s):
```
$ ./run -s scripts/testFile.text
```

**Specify results directory**
You can use the `-d` flag to specify the directory where the results will be stored:
```
$ ./run -d results/path/to/results/dir/ scripts/testFile.txt
```
This will create a directory (with the current timestamp) and store the results in that directory. If results directory is not specified it will default to `results/` directory to store the results.

**Specify test browser**
`-b` flag will allow you to specify the test browser (`chrome|safari|firefox|iexplorer`). Default browser is Chrome
```
$ ./run -b chrome scripts/testFile.txt
```

**Set results directory to Dropbox**
This is so that the results can be accessed from multiple devices. You will need to check/change the path/to/dropbox in run file underneath -p option. 
```
$ ./run -p scripts/testFile.txt
```

**Note:** Make sure that you specify the test script(s) at the ned of the command like the examples given above. This is because the flags need to be set before specifying the test scripts.

### Test script command options
| Command | Example | Description |
|---------|---------|-------------|
| `test` | `test Custodian trans 01` | Initialises a new test with new Title. Resets previous session history |
| `description` | `description CUST USD transaction 01` | Records the purpose of each test |
| `#` | `# this is a test related commnet` | Anything after `#` is considered as a comment |
| `output` | `output` | Sets a new output file to write the test results to |
| `goto` | `goto url` or `goto dev` | Navigate to the specified url. URL can also be a YAML variable such as `dev`|
| `login` | `login aix_user1 aix_pass1` | Uses the username and password details from YAML file to log in to the system account. |
| `logout` | `logout` | Clicks the logout button within the usermenu |
| `menu` | `menu transactions` | Clicks on the Transactions link in the dropdown menu |
| `usermenu` | `usermenu my settings` | Click on the settings link on the usermenu dropdown |
| `date` | `date`, `date + 2`, `date - 4 ignore_weekends`  | saves the date from the home page and add/subtract days out of it (allows to ignore_weekends) |
| `time` | `time`, `time + 1` | Sets the time that can be used in the text field |
| `sleep` | `sleep 3` | Pauses the framework for 3 seconds. Don't use this if not necessary as it'll slow down the tests |
| `refresh` | `refresh` | Refreshes the current page |
| `button` | `button new` or `button order` | Clicks on the button specified |
| `form` | `form admTrans` | Stores a keyword that is used as the first keyword in an element id |
| `textInput` | `textInput amount 500,0000` or `textInput due date` | Enters a text to the field with the `amount` id. You can dynamically enter dates from the system |
| `menuInput` | `menuInput country New Zealand` | Clicks on the element `New Zealand` in the field with id `country`  |
| `select2Input` | `select2Input instrumentStr USD` | Enters the text `USD` to field with id `instrumentStr` |
| `checkerinput` | `checkerinput saveInstr` | Check/Uncheck the checker element with id `saveInstr` |
| `clear_input` | `clear_input instrumentStr` | Clears the textField with id `instrumentStr` |
| `tableWait` | `tableWait` | Waits until the Data Processing text appears and then disappears  |
| `find` | `find button save` or `find textH1 View Create` | Finds the element in the webpage |
| `scrollto` | `scrollto user-new-btn` | Scrolls the view to include the position of a specific element in the page (by id). |
| `clickby` | `clickby id btn-new` or `clickby class btn-new create` | Clicks on the first element found by id, class text or xpath |
| `expect` | `expect pass` or `expect fail` | Checks /if the test assumption made by the tester matches with the result of the tests |
| `saveID` | `saveID` | Finds and saves the id displayed for a particular object created |
| `search` | `search s_stat Ready`, `search s_inst saveID` | search for an element by clicking on drop down on entering text to search field. text can be the id saved before |
| `back` | `back` | Navigates back to the page browser was at before |
| `screenshot` | `screenshot fileName full`, `screenshot fileName time`| Takes the screenshot of the webpage with timestamp as its name |
| `findAndScreenshot` | `n/a` | Finds element looking for and screenshot it. **Note:** This command is configured specific to the 'screenshot' project |
| `window` | `window 2` or `window new` | Creates a new browser window or change window to the other open browser window/tab |
| `tableClick` | `tableClick Investor saveID` | Clicks on an element in a particular column based on column name and row value |

**NB1:** There are more options for each command that has not been specified in the table above. You can find them by reading the documentation for the framework in `lib/commands.rb`.

**NB2:** An example test_script can be found in `scripts/example_test.txt`. Try running `./run scripts/example_test.txt` 🙂

### Some things to note
- The testing framework was built using the Ruby gem Selenium. At the time of building the framework, the version of ruby being used is ruby `2.5.0p0`
- The ChromeDriver version that is being used is `2.37`. When the install script is run it will automatically download the 2.37 version if it is not already using that version.
- The only gem that is currently being used needs for running the system is `selenium-webdriver`
- Some of the directories (such as `results/` and `screenshots/`) are ignored by `.gitignore` (These files will not be present when the repository is pulled from or pushed to). These folders are necessary for the proper function of the framework. The `install` script should take care of the creation of these directories (if they don't exist).
- Running the tests on Safari for the first time might return an error. This is usually because 'remote automation’ might not be allowed in your version of safari. To allow remote automation:
    - Open Safari
    - Go to Develop in the tools bar
    - Click on ‘Allow Remote Automation’
- Some of the elements in the system does not have IDs (or have abnormal IDs generated by Symfony). At the moment, classes or xpaths are used instead tp handle those cases. These might have to be fixed for efficient usage of the testing framework. Some of these elements are:
    - Menu links
    - 'New' Buttons
    - 'Download' Button
    - Select2 Text Fields
    - Login Button - Commodity

### Troubleshooting

If the test scripts created did not run properly, it could be because of the following reasons:

- **Test scripts are old and had been run before:** some of the test scripts might had been run before and so the database might already have the same inputs saved (i.e. system not allowing duplicate inputs).
    - **Solution:** update the test script with new values.
- **The test script might contain unknown commands/ input types (or typos):** The framework ignores commands does not match the known commands. This might affect the commands that follows the typo command.
    - **Solution:** Check for typos in the command
    - Make sure that the commands such as `date + 2` have spaces between each parameter.
    - Ensure that the command is entered in the order the table above specifies.
- **The commands in main.rb might be using xpath instead of IDs:** This is because those elements does not have any IDs - can be fixed by adding IDs to those elements and changing the script command to look for IDs (more reliable)
- **Server is taking too much time to load:** The only solution to this problem is to add explicit wait times to the commands in main.rb file. The framework already implements explicit wait times at places where it is necessary (**N.B.** don’t use sleep/ explicit waits unless required, or it will slow down the tests).

For any other issues with the framework or suggestions on improving the framework, mention the current maintainer or create an issue.

**Happy Testing!** 😎