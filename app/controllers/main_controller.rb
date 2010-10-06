class MainController < ApplicationController

  def index
    @legendas = Legendas.destaques
  end

end
