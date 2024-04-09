class BooksController < ApplicationController
  def index
    @q = Book.ransack(params[:q])
    @q.sorts = 'id DESC' if @q.sorts.empty?
    @pagy, @books = pagy(@q.result)
  end

  def new
    @book = Book.new
  end

  def create
  end

  private

  def resource_params
    params.require(:book).permit(:name, :birth, :death)
  end
end
