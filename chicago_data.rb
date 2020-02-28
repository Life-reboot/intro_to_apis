require "http"

response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")
pp response.parse
