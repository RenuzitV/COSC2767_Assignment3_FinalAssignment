from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys


class RMITSearchPage:
  # URL
  # change web url here if needed test local
  URL = "http://35.153.46.184/"

  # Locators
  CLOTH_BTN = (By.XPATH,
               '//*[@id="bs-example-navbar-collapse-1"]/div[1]/ul/li[1]/a')
  ACCESSORIES_BTN = (
      By.XPATH, '//*[@id="bs-example-navbar-collapse-1"]/div[1]/ul/li[2]/a')
  STATIONERY_BTN = (By.XPATH,
                    '//*[@id="bs-example-navbar-collapse-1"]/div[1]/ul/li[3]/a')
  COURSE_BTN = (By.XPATH,
                '//*[@id="bs-example-navbar-collapse-1"]/div[1]/ul/li[4]/a')
  SPEC_COLLECTION_BTN = (
      By.XPATH, '//*[@id="bs-example-navbar-collapse-1"]/div[1]/ul/li[5]/a')
  SALE_BTN = (By.XPATH,
              '//*[@id="bs-example-navbar-collapse-1"]/div[1]/ul/li[6]/a')
  BUY_BTN = (By.XPATH, '/html/body/section[1]/div/div/a')

  # Initializer
  def __init__(self, browser):
    self.browser = browser

  # Interaction Methods
  def load(self):
    self.browser.get(self.URL)

  def cloth_btn(self):
    cloth_btn_input = self.browser.find_element(*self.CLOTH_BTN)
    self.browser.execute_script("arguments[0].click();", cloth_btn_input)

  def accessories_btn(self):
    accessories_btn_input = self.browser.find_element(*self.ACCESSORIES_BTN)
    self.browser.execute_script("arguments[0].click();", accessories_btn_input)

  def stationery_btn(self):
    stationery_btn_input = self.browser.find_element(*self.STATIONERY_BTN)
    self.browser.execute_script("arguments[0].click();", stationery_btn_input)

  def course_btn(self):
    course_btn_input = self.browser.find_element(*self.COURSE_BTN)
    self.browser.execute_script("arguments[0].click();", course_btn_input)

  def special_btn(self):
    special_btn_input = self.browser.find_element(*self.SPEC_COLLECTION_BTN)
    self.browser.execute_script("arguments[0].click();", special_btn_input)

  def sale_btn(self):
    sale_btn_input = self.browser.find_element(*self.SALE_BTN)
    self.browser.execute_script("arguments[0].click();", sale_btn_input)

  def buy_btn(self):
    buy_btn_input = self.browser.find_element(*self.BUY_BTN)
    self.browser.execute_script("arguments[0].click();", buy_btn_input)
    return self.browser.current_url

  def title(self):
    return self.browser.title
  
  # integration test
  def search(self, phrase):
    search_input = self.browser.find_element(*self.SEARCH_INPUT)
    search_input.send_keys(phrase + Keys.RETURN)

  def search_value(self):
    search_input = self.browser.find_element(*self.SEARCH_INPUT)
    value = search_input.get_attribute('value')
    return value
  
  def search_results(self):
    return self.browser.find_elements(*self.SEARCH_RESULTS)
  
  def search_result_titles(self):
    titles = self.browser.find_elements(*self.SEARCH_RESULT_TITLES)
    titles = [t.text for t in titles]
    return titles
  
  def search_result_descriptions(self):
    descriptions = self.browser.find_elements(*self.SEARCH_RESULT_DESCRIPTIONS)
    descriptions = [d.text for d in descriptions]
    return descriptions
  
  def search_result_links(self):
    links = self.browser.find_elements(*self.SEARCH_RESULT_LINKS)
    links = [l.get_attribute('href') for l in links]
    return links

