require 'rss'

class Aggregator
  SITES = [
    { name: "Invest In Cannabis", link: "http://www.investincannabis.com/feed/", description: "", articles: [] },
    { name: "Marijuana Venture", link: "http://www.marijuanaventure.com/feed/", description: "", articles: [] },
    { name: "The Daily Chronic", link: "http://www.thedailychronic.net/feed/", description: "", articles: [] },
    { name: "Marijuana Business Daily", link: "http://mjbizdaily.com/feed/", description: "", articles: [] },
    { name: "High Times", link: "https://feeds.feedburner.com/HIGHTIMESMagazine", description: "", articles: [] },
    { name: "Cannabis Business Times", link: "http://www.cannabisbusinesstimes.com/rss", description: "", articles: [] },
    { name: "Marijuana Stocks", link: "http://marijuanastocks.com/feed/", description: "", articles: [] },
    { name: "Weed Worthy", link: "https://feeds.feedburner.com/Weedworthy-TodaysCannabisNewsNetwork", description: "", articles: [] },
    { name: "Cannabis Culture", link: "http://www.cannabisculture.com/feed", description: "", articles: [] },
    { name: "Investing News - Cannabis", link: "http://investingnews.com/category/daily/resource-investing/agriculture-investing/cannabis-investing/feed/", description: "", articles: [] },
    { name: "The Weed Blog", link: "https://feeds.feedburner.com/TheWeedBlogcom", description: "", articles: [] },
    { name: "Dope Magazine", link: "http://www.dopemagazine.com/feed/", description: "", articles: [] },
    { name: "New Cannabis Ventures", link: "https://www.newcannabisventures.com/feed/", description: "", articles: [] },
    { name: "Ganjapreneur", link: "http://www.ganjapreneur.com/feed/", description: "", articles: [] },
    { name: "Cannabis-Chronicles", link: "http://cannabis-chronicles.com/feed/", description: "", articles: [] },
    { name: "Cashinbis", link: "https://feeds.feedburner.com/cashinbis", description: "", articles: [] },
    { name: "Marijuana", link: "http://www.marijuana.com/feed/", description: "", articles: [] }
  ]



  def generate_news
    news = []
    SITES.each_with_index do |site, index|
      today = Time.now.beginning_of_day
      news << site
      rss = RSS::Parser.parse(site[:link], false)
      rss.items.each do |item|
        if site[:link].match(/feedburner/)
          if item.date == nil
            if item.dc_date >= today
              news[index][:articles] << { title: item.title, description: item.description, link: item.link }
            end
          elsif item.date >= today
            news[index][:articles] << { title: item.title, description: item.description, link: item.link }
          end
        elsif item.date >= today
          news[index][:articles] << { title: item.title, description: item.description, link: item.link }
        end
      end
    end
    news
  end
end
