require 'net/http'
require 'open-uri'

class CloudMiner; class << self

  def mine
    mine_eruptions
    mine_earthquakes
  end

  def mine_eruptions
    uri = URI('https://www.ngdc.noaa.gov/nndc/struts/results?type_0=Exact&query_0=$HAZ_EVENT_ID&t=102557&s=50&d=54&dfn=volerup.txt')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    resp = http.request(request)

    open(Rails.root.join('data','eruption.tsv'), "wb") do |file|
        file.write(resp.body)
    end
    puts 'data/eruptions.tsv Successfully Updated!'
  end

  def mine_earthquakes
    uri = URI('https://www.ngdc.noaa.gov/nndc/struts/results?type_0=Exact&query_0=$ID&t=101650&s=13&d=189&dfn=signif.txt')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    resp = http.request(request)

    open(Rails.root.join('data','earthquake.tsv'), "wb") do |file|
        file.write(resp.body)
    end
    puts 'data/earthquakes.tsv Successfully Updated!'
  end

end; end
