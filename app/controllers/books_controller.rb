class BooksController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    if list.save
      redirect_to book_path(list.id), notice: 'Book was successfully created.'
    else
      render :index
    end
  end

  def index
  @lists = List.all
  @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
   if list.update(list_params)
    redirect_to book_path, notice: 'Book was successfully updated.'
   else
      raise book.error
   end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to book_path
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
