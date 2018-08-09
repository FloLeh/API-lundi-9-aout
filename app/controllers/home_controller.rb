class HomeController < ApplicationController
  def index
    @crypto = Crypto.new
    StartScrap.new.save
  end

  def search
    @crypt = StartScrap.new.perform(params[:crypto][:name])
    if @crypt == []
      redirect_to root_url, danger: "La monnaie n'existe pas"
    end
  end

  def list
  end

end
