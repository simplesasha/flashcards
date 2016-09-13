class CardsController < ApplicationController
  def index
    @card = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(params[:card].permit(:original_text, :translated_text, :review_date))
  	if @card.save
  	  redirect_to cards_path
  	else
  	  render 'new'
  	end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path
  end  

  def edit
    @card = Card.find(params[:id]) 
  end 

  def update
  	@card = Card.find(params[:id])
  	if @card.update(params[:card].permit(:original_text, :translated_text, :review_date))
  	  redirect_to cards_path
  	else
  	  render 'edit'
  	end
  end
end
