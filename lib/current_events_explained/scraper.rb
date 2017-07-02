class CurrentEventsExplained::Scraper

  def open_explainer_page
    Nokogiri::HTML(open("https://www.vox.com/explainers"))
  end

  def scrape_explainer
    self.open_explainer_page.css("h2.c-entry-box--compact__title")
  end


  def make_articles
    scrape_explainer.each do |article|
      CurrentEventsExplained::Articles.new_articles(article)
    end
  end

end