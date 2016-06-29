require './environment'

module FormsLab
  class App < Sinatra::Base
    get '/' do
      erb :'/pirates/index.html'
    end

    get '/new' do
      erb :'/pirates/new.html'
    end

    post '/pirates' do 
      @pirate = Pirate.new(params[:pirate])
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ships = Ship.all
      erb :'/pirates/show.html'
    end
    

  end
end
