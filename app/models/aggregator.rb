class Aggregator
  SITES = [
    { name: "Marijuana Venture", link: "http://www.marijuanaventure.com/feed/", description: "", articles: [] },
    { name: "The Daily Chronic", link: "http://www.thedailychronic.net/feed/", description: "", articles: [] },
    { name: "Invest In Cannabis", link: "http://www.investincannabis.com/feed/", description: "", articles: [] }
  ]

  def self.generate_news
    news = []
    SITES.each_with_index do |site, index|
      today = Time.now.beginning_of_day
      news << site
      rss = RSS::Parser.parse(site[:link], false)
      rss.items.each do |item|
        if item.date >= today
          news[index][:articles] << { title: item.title, description: item.description, link: item.link }
        end
      end
    end
    news
  end
end
