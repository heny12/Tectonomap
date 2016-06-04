require 'net/http'

class CloudMiner; class << self

  def mine
    mine_eruptions
    mine_earthquakes
  end

  def mine_eruptions
    url = URI.parse('http://www.ngdc.noaa.gov/nndc/struts/results?type_0=Exact&query_0=$HAZ_EVENT_ID&t=102557&s=50&d=54&dfn=volerup.txt')
    req = Net::HTTP::Get.new(url.to_s)
    resp = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    open(Rails.root.join('data','eruption.tsv'), "wb") do |file|
        file.write(resp.body)
    end
    puts 'data/eruptions.tsv Successfully Updated!'
  end

  def mine_earthquakes
    url = URI.parse('http://www.ngdc.noaa.gov/nndc/struts/results?type_0=Exact&query_0=$ID&t=101650&s=13&d=189&dfn=signif.txt')
    req = Net::HTTP::Get.new(url.to_s)
    resp = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    open(Rails.root.join('data','earthquake.tsv'), "wb") do |file|
        file.write(resp.body)
    end
    puts 'data/earthquakes.tsv Successfully Updated!'
  end

end; end
