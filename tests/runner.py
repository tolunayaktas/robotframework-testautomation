from robot import run


test_files = [
    "tests/home_tests.robot",
    "tests/login_tests.robot"
]


run(*test_files, include=["all"], output="output.xml", log="log.html", report="report.html")