class HolaController < ApplicationController
  def index # Este es el método
    @nombre = params[:nombre] || "Friend"  end
end
