class HomeController < ApplicationController

  #lors du premier lancement decommenter la ligne 5 pour pouvoir scrapper ensuite remettre en commentaire.merci
  def index
    if Bitcoin.first == nil
      StartScrap.new.perform
    end
    @bitcoins = Bitcoin.all
    puts params
  end

  def create
    @bitcoin = Bitcoin.new
      if Bitcoin.find_by(name: params[:recherche])
        redirect_to bitcoin_path(Bitcoin.find_by(name: params[:recherche]).id)
      else
        redirect_to(root_path)
        return
      end
  end

  

end
