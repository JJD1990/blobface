class WeatherController < ApplicationController
    def show
      @weather = WeatherApi.fetch_weather(params[:city])
      if @weather[:error]
        flash[:alert] = @weather[:error]
        redirect_to request.referer
      end
      puts @weather
    end
end
  