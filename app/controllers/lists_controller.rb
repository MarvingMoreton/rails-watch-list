class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
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

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name, photos: [])
  end
end
