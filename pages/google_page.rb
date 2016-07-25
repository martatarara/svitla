require 'page-object'

class GooglePage
  include PageObject

  page_url 'https://www.google.com/'

  #locators
  text_field :search_field, id: 'lst-ib'
  button :search_btn, class: 'lsb'
  link :first_wiki_link, xpath: "//div[@class='g'][1]//a[contains(text(), 'Wikipedia')]"
  link :next_to_wiki_link, xpath: "//div[@class='g'][1]//h3[@class='r']//a[not(contains(text(), 'Wikipedia'))]"

  #methods
  def search_for(word)
    self.search_field = word
    self.search_btn
  end

  def open_wiki_page
    self.first_wiki_link_element.when_visible(20).click
  end

  def open_next_site
    self.next_to_wiki_link_element.when_visible(20).click
  end

end