require 'http'
require 'time'
require 'openssl'
require 'base64'
require 'json'

def auth_header
  app_id = 'FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF'
  app_key = 'FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF'
  data = "x-date: #{Time.now.httpdate}"
  hmac = OpenSSL::HMAC.digest('sha1', app_key, data)
  signature = Base64.strict_encode64(hmac)
  authorization = ''
  authorization << "hmac username=\"#{app_id}\", algorithm=\"hmac-sha1\", headers=\"x-date\", signature=\"#{signature}\""

  {
    'Accept': 'application/json',
    'Authorization': authorization,
    'x-date': Time.now.httpdate,
    'Accept-Encoding': 'gzip'
  }
end

response = HTTP.use(:auto_inflate).headers(auth_header)
               .get("https://ptx.transportdata.tw/MOTC/v2/Bus/EstimatedTimeOfArrival/City/Taipei/236?$filter=StopUID%20eq%20'TPE134745'&$top=10&$format=JSON")

res_hash = JSON.parse(response)

if res_hash.first["EstimateTime"] <= 300
  puts "Incoming! #{res_hash.first["EstimateTime"]} seconds left!"
else
  puts "Zzz... #{res_hash.first["EstimateTime"]} seconds left!"
end
