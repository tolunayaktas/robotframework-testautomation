# Robotframe Test Automation Project for Dmate Webshop

## Getting Started:

### Prerequisites:

- Python 3.12.8 (Recommended) or later

- pip (Python package installer)

- Virtualenv (optional, for creating virtual environments)

Creating a Virtual Environment (Optional):


```bash
  virtualenv venv
  source venv/bin/activate
```


### Installing Required Packages:

```bash
  pip install robotframework
  pip install robotframework-seleniumlibrary
  pip install webdriver-manager python-dotenv
```


### Usage (to execute tagged test cases):

```bash
  python tests/runner.py
```


## Execution on Linux/Ubuntu (WSL):

- Install WSL  (https://learn.microsoft.com/en-us/windows/wsl/install)

(Relevant packages must be installed on the machine.)


```bash
  wsl -d Ubuntu
  cd "your_project"  # Enter the location where your project is located.
```



- Activate the Virtual Environment:

```bash
source .venv/bin/activate
```

- Run Tests

```bash
python tests/runner.py
```

