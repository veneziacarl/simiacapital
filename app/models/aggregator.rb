require 'rss'

class Aggregator
  SITES = [
    { name: "Invest In Cannabis", link: "http://www.investincannabis.com/feed/" },
    { name: "Marijuana Venture", link: "http://www.marijuanaventure.com/feed/" },
    { name: "The Daily Chronic", link: "http://www.thedailychronic.net/feed/" },
    { name: "Marijuana Business Daily", link: "http://mjbizdaily.com/feed/" },
    { name: "High Times", link: "https://feeds.feedburner.com/HIGHTIMESMagazine" },
    { name: "Cannabis Business Times", link: "http://www.cannabisbusinesstimes.com/rss" },
    { name: "Marijuana Stocks", link: "http://marijuanastocks.com/feed/" },
    { name: "Weed Worthy", link: "https://feeds.feedburner.com/Weedworthy-TodaysCannabisNewsNetwork" },
    { name: "Cannabis Culture", link: "http://www.cannabisculture.com/feed" },
    { name: "Investing News - Cannabis", link: "http://investingnews.com/category/daily/resource-investing/agriculture-investing/cannabis-investing/feed/" },
    { name: "The Weed Blog", link: "https://feeds.feedburner.com/TheWeedBlogcom" },
    { name: "Dope Magazine", link: "http://www.dopemagazine.com/feed/" },
    { name: "New Cannabis Ventures", link: "https://www.newcannabisventures.com/feed/" },
    { name: "Ganjapreneur", link: "http://www.ganjapreneur.com/feed/" },
    { name: "Cannabis-Chronicles", link: "http://cannabis-chronicles.com/feed/" },
    { name: "Cashinbis", link: "https://feeds.feedburner.com/cashinbis" },
    { name: "Marijuana", link: "http://www.marijuana.com/feed/" },
    { name: "Green Rush Daily", link: "https://feeds.feedburner.com/greenrushdaily/PjBE" },
    { name: "Cannabis Business Executive", link: "http://www.cannabisbusinessexecutive.com/feed/" },
    { name: "The Cannabist", link: "http://www.thecannabist.co/feed/" },
    { name: "MJI News", link: "http://mjinews.com/feed/" },
    { name: "Pot Stocks", link: "http://pot-stocks.com/feed/" },
    { name: "Marijuana Index", link: "http://marijuanaindex.com/feed/" },
    { name: "420 Magazine", link: "https://www.420magazine.com/feed/" },
    { name: "Marijuana Politics", link: "http://marijuanapolitics.com/feed/" },
    { name: "Cannabis Now Magazine", link: "http://cannabisnowmagazine.com/feed" },
    { name: "Marijuana Times", link: "http://www.marijuanatimes.org/feed/" },
    { name: "Cannabis Industry Journal", link: "http://www.cannabisindustryjournal.com/feed/" },
    { name: "420 Intel", link: "http://420intel.com/rss.xml" }
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
        elsif item.date >= today && item.date != nil
          news[index][:articles] << { title: item.title, description: item.description, link: item.link }
        end
      end
    end
    news
  end
end
