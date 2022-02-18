class BookmarksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @movies = @list.movies
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(book_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_bookmarks_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    list = List.find(@bookmark[:list_id])
    redirect_to list_bookmarks_path(list)
  end

  private

  def book_params
    params.require(:bookmark).permit(%i[movie_id comment])
  end
end
