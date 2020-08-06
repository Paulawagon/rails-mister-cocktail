class CocktailsController < ApplicationController
      before_action :set_cocktail, only: [:show]

     def index
       @cocktails = Cocktail.all
     end

     def show
       @cocktail = Cocktail.find(params[:id])
       @dose = Dose.new
       @dose.cocktail = Cocktail.find(params[:id])
       @ingredient = Ingredient.new
       @ingredients = Ingredient.all
     end

     def new
       @cocktail = Cocktail.new
     end

     def create
       @cocktail = Cocktail.create(cocktail_params)
       if @cocktail.save
         redirect_to cocktail_path(@cocktail)
       else
         @cocktail = Cocktail.new(cocktail_params)
         render :new
       end
     end

     private

     def cocktail_params
       params.require(:cocktail).permit(:name)
     end

     def set_cocktail
       @cocktail = Cocktail.find(params[:id])
     end
end
