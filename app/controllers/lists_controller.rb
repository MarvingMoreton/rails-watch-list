class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find((params[:id]))
    # @bookmark = Bookmark.new
    @bookmarks = @list.bookmarks
  end

  def create
    @list = List.new(list_params)
    # if creation is a success
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created.'
      # if creation is a failure
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
