class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.new(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new
    @cocktail = Cocktail.new(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end
end
