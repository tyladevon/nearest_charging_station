class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.adapter  Faraday.default_adapter
    end

    response = conn.get('api/alt-fuel-stations/v1.json') do |request|
      request.params['limit'] = '1'
      request.params['api_key'] = ENV['nrel_key']
      request.params['location'] = "17th St, Denver, CO, 80202"
      request.params['radius'] = '5'
      request.params['access_code'] = 'public'
    end

    results = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
