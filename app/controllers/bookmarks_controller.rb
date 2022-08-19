class BookmarksController < ApplicationController
  #before_action  :set_bookmark, only: %i[:new, create]

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    if @bookmark.save
      #redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:bookmark).permit(:comment)
  end

end
