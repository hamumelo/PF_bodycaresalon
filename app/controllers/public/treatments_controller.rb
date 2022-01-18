class Public::TreatmentsController < ApplicationController
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
    # if @treatment.save
    #   flash[:notice] = "施術コースを登録しました"
    # redirect_to admin_treatments_path(@treatment.id)
    # else
    # @treatment = Treatment.new
    # @genres = Genre.all
    # end
  end
  
  def show
    @treatment = Treatment.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @treatment = Treatment.find(params[:id])
    @genres = Genre.all
  end

  def update
     @treatment = Treatment.find(params[:id])
     @treatment.update(treatment_params)
    redirect_to admin_treatments_path(@treatment.id)
    # if @item.update(item_params)
    #   flash[:notice] = "施術コースを更新しました"
    # redirect_to admin_treatments_path(@treatment.id)
    # else
    #   render :edit
    # end
  end

  private

  def treatment_params
    params.require(:treatment).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
  
end
