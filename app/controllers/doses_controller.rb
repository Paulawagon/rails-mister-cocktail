class DosesController < ApplicationController
    before_action :set_dose, only: [:show, :destroy, :edit]

     def index
       @doses = Dose.all
     end

     def show
     end

     def new
       @dose = Dose.new
     end

     def create
       @dose = Dose.create(dose_params)
       @cocktail = Cocktail.find(params[:cocktail_id].to_i)
       @dose.cocktail = @cocktail
       if @dose.save
         redirect_to cocktail_path(@dose.cocktail)
       else
         # params[:dose][:cocktail_id] = @cocktail.id.to_s
         @ingredient = Ingredient.find(params[:dose][:ingredient_id].to_i)
         render cocktail_path(@cocktail)
       end
     end

     def edit
     end

     def destroy
       @dose.destroy
       redirect_to cocktail_path(@dose.cocktail)
     end

     private

     def dose_params
       params.require(:dose).permit(:cocktail_id, :ingredient_id, :quantity, :description)
     end

     def set_dose
       @dose = Dose.find(params[:id])
     end
end
