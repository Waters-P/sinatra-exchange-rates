


require "sinatra"
require "sinatra/reloader"
require "http"




get("/") do

  

  exchange_rate_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}"

# Place a GET request to the URL
  @raw_res = HTTP.get(exchange_rate_url)

  @raw_res = @raw_res.to_s

  @parsed_data = JSON.parse(@raw_res)

  erb(:root)



end



pp ENV.fetch("EXCHANGE_RATE_KEY")
