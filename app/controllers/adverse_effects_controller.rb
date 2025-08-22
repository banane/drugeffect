require 'net/http'
require 'uri'

API_KEY="Q3srtj4qMKXjVVKBgXsd0yj4UsFwtohN1D4t4sGm"

class AdverseEffectsController < ApplicationController
    def index

        uri = URI.parse('https://api.fda.gov/drug/drugsfda.json?limit=15')
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true # Use SSL for HTTPS requests

        request = Net::HTTP::Get.new(uri.request_uri)
        request['Authorization'] = API_KEY 
        request['Content-Type'] = 'application/json' 
        response = http.request(request)
        @results = JSON.parse(response.body)['results']
        @seriouseffects = seriouseffects
    end

    def filtered # takes effect
        @effect = params['effect']
        effecttype = "seriousness" + @effect
        uristring = "https://api.fda.gov/drug/event.json?search=#{effecttype}:1&limit=15"
        uri = URI.parse(uristring)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true # Use SSL for HTTPS requests

        request = Net::HTTP::Get.new(uri.request_uri)
        request['Authorization'] = API_KEY 
        request['Content-Type'] = 'application/json' 
        response = http.request(request)
        @results = JSON.parse(response.body)['results']
        @seriouseffects = seriouseffects
    end

    def manufacturers
        # ranked list of manufacturers by number of serious events
        # search: serious i 1/0
        manufactuers_hash = {}
        results = callSeriousEvents

        # add count to hash if serious event
        while results > 0 || results != nil # can also check on meta.results.total is zero
            results  callSeriousEvents            
            # process hash
            
        end

        @manufacturers = []
        # sort by value of hash
        # return manufacturers top of list
    end

    private

    def callSeriousEvents
        uristring = "https://api.fda.gov/drug/event.json?search=serious:1&limit=15"
        uri = URI.parse(uristring)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true # Use SSL for HTTPS requests

        request = Net::HTTP::Get.new(uri.request_uri)
        request['Authorization'] = API_KEY 
        request['Content-Type'] = 'application/json' 
        response = http.request(request)
        JSON.parse(response.body)['results']
    end

    def seriouseffects
        @seriouseffects = ['hospitalization','death','congenitalanomali', 'disabling','lifethreatening','other' ]
    end

end
