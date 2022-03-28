class Admin::TreatmentsController < ApplicationController


  def index
     @treatments = Treatment.all
  end

  def new
     @treatment = Treatment.new
     @genres = Genre.all
  end

  def create
     @treatment = Treatment.new(treatment_params)
     @treatment.save
    redirect_to admin_treatments_path(@treatment.id)
    # if @item.save
    #   flash[:notice] = "genre was successfully created."
    # redirect_to admin_items_path(@item.id)
    # else
    # @item = Item.new
    # @genres = Genre.all
    # end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
     @item = Item.find(params[:id])
     @item.update(item_params)
    redirect_to admin_treatments_path(@treatment.id)
    # if @item.update(item_params)
    #   flash[:notice] = "You have updated genre successfully."
    # redirect_to admin_item_path(@item.id)
    # else
    #   render :edit
    # end
  end

  private

  def treatment_params
    params.require(:treatment).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end

end
