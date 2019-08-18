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
$ ./run
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

#### Test script command options
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