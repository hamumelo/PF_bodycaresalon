class Admin::GenresController < ApplicationController

  def index
     @genres = Genre.all
     @genre = Genre.new
  end

  def create
     @genre = Genre.new(genre_params)
     @genre.save
    redirect_to admin_genres_path(@genre.id)
    # if @genre.save
    #   flash[:notice] = "施術ジャンルを登録しました。"
    
    # redirect_to admin_genres_path(@genre.id)
    # else
    #   @genres = Genre.all
    #   render :index
    # end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end

  def update
     @genre = Genre.find(params[:id])
     @genre.update(genre_params)
    redirect_to admin_genres_path
    # if @genre_post.update
    #   flash[:notice] = "施術ジャンルを更新しました"
    # redirect_to admin_genres_path(@genre.id)
    # else
    #   render :edit
    # end
  end
   
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
      # flash[:notice] = "施術ジャンルを削除しました"
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
