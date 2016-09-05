class CardsController < ApplicationController
  def show
  @card = Card.all.order(:id)
  end
end
