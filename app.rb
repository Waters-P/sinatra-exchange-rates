


require "sinatra"
require "sinatra/reloader"
require "http"


get("/") do

  

  exchange_rate_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}"


# Place a GET request to the URL
  @raw_res = HTTP.get(exchange_rate_url)

  @raw_res = @raw_res.to_s

  @parsed_data = JSON.parse(@raw_res)


  @currencies = @parsed_data.fetch("currencies")

  @list_of_countries_abbr = @currencies.keys 

  @amount_of_currencies = @list_of_countries_abbr.length


  erb(:root)

end



get("/:base_currency") do

  @bc = params.fetch(:base_currency)

 
  
  erb(:bc)

end








get("/:base_currency/:target_currency") do

  @bc = params.fetch(:base_currency)

  @tc = params.fetch(:target_currency)

  conversion_url = "https://api.exchangerate.host/convert?from=#{@bc}&to=#{@tc}&amount=1&access_key=#{ENV.fetch("EXCHANGE_RATE_KEY")}"

# Place a GET request to the URL
  @raw_res = HTTP.get(conversion_url)

  @raw_res = @raw_res.to_s

  @parsed_data = JSON.parse(@raw_res)

  @result = @parsed_data.fetch("result")

 
  
  erb(:results)

end




  
