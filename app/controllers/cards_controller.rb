class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @card = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(params_of_card)
  	if @card.save
  	  redirect_to cards_path
  	else
  	  render 'new'
  	end
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end  

  def edit
  end 

  def update
  	if @card.update(params_of_card)
  	  redirect_to cards_path
  	else
  	  render 'edit'
    end
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def params_of_card
      params[:card].permit(:original_text, :translated_text, :review_date)
  end
end
