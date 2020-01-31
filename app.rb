require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      "Welcome to the Nested Forms Lab!"
    end
    
    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      puts params
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      # params["pirate"]["ships"].each do |ship_data|
      #   Ship.new(ship_data["name"], ship_data["type"], ship_data["booty"])
      # end

      # @pirate = Pirate.new(params["pirate"]["name"], params["pirate"]["height"], params["pirate"]["weight"])

      @ships = Ship.all

      erb :'pirates/show'
    end
  end
end
