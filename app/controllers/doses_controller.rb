class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def index
  end

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_param)
    @dose.cocktail = set_cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_param
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
