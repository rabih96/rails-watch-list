class BookmarksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @movies = @list.movies
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    list = List.find(@bookmark[:list_id])
    redirect_to list_bookmarks_path(list)
  end
end
