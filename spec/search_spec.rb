require 'require_all'
require_rel '../pages'
require 'spec_helper'

describe 'Google search for aikido' do
  search_word = 'Aikido'
  context 'Open Wikipedia' do
    before :all do
      visit(GooglePage).search_for search_word
      on(GooglePage).open_wiki_page
    end
    it 'wiki page is opened' do
      expect(@current_page.current_url).to include 'wikipedia'
    end
    it 'wiki page contains proper info' do
      expect(@current_page.text).to include 'Aikido'
    end
    after :all do
      @browser.driver.save_screenshot('screenshots/wiki_page.png')
    end
  end

  context 'Open site next after Wikipedia' do
    before :all do
      visit(GooglePage).search_for search_word
      on(GooglePage).open_next_site
    end
    it 'page contains proper info' do
      expect(@current_page.text).to include 'Aikido'
    end
    after :all do
      @browser.driver.save_screenshot('screenshots/other_page.png')
    end
  end
end