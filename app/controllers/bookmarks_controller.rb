class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  def destroy
    # raise
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path(@bookmark.list), notice: 'Bookmark has been destroyed.'
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = @list.id
    # we can also do @bookmark.list = @list

    # If creation is a success
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
      # If creation failed
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    # missing the second params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
