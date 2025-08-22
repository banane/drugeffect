require 'net/http'
require 'uri'

API_KEY="INSERT YOUR API KEY HERE"

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

    private

    def seriouseffects
        @seriouseffects = ['hospitalization','death','congenitalanomali', 'disabling','lifethreatening','other' ]
    end

end
