from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager

def get_browser():
    options = webdriver.ChromeOptions()
    options.add_argument("--start-maximized")
    return webdriver.Chrome(ChromeDriverManager().install(), options=options)
