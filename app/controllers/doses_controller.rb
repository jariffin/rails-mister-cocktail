class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new
  end

  def create
    # doses_params will retrieve the form inputs from the user
    @dose = Dose.new(doses_params)
    # we still need to find which cocktail it's associated with
    @cocktail = Cocktail.find(params[:cocktail_id])
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

  def doses_params
    # we need the cocktail id, the ingredient id, and description, but the cocktail_id will be taken from the method.
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
