class CardsController < ApplicationController
  def index
    @card = Card.all.order(:id)
  end
end
