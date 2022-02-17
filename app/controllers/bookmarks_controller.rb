class BookmarksController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @movies = @list.movies
  end
end
