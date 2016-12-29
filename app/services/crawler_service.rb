require 'ostruct'
require 'open-uri'


class CrawlerService
  USER_AGENTS    = ::Mechanize::AGENT_ALIASES.keys
  TAGS__FOR_SELECTOR = %w(h1 h2 h3 a)

  def crawl_list(url)
    agent = ::Mechanize.new do |agent|
      agent.user_agent_alias = USER_AGENTS.first
    end

    begin
      page = agent.get(url)

      page.search(TAGS__FOR_SELECTOR.join(',')).each do |f|
         StoredContent.create!(source: url, tag: f.name, content: f.text.strip,
                               html_attrs: f.attributes.map{|k,v| [k, v.value] }.to_h )
      end
    rescue SocketError
      return false
    end

    agent.shutdown
     return true
  end




end