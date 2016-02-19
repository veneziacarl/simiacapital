class Aggregator
  def self.generate_articles
    @articles = []
    rss = RSS::Parser.parse('http://www.marijuanaventure.com/feed/', false)
    rss.items.each do |item|
      @articles << { title: item.title, description: item.description, link: item.link }
    end
    @articles
  end
end
