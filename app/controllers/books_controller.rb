class BooksController < ApplicationController
  before_action :find_resource, only: [:edit, :update, :destroy]

  def index
    @q = Book.includes(:author).ransack(params[:q])
    @q.sorts = 'id DESC' if @q.sorts.empty?
    @pagy, @books = pagy(@q.result)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(resource_params)

    if @book.save
      flash[:notice] = 'Book created successfully'
      respond_to do |format|
        format.html { redirect_to books_path }
        format.turbo_stream
      end
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(resource_params)
      flash[:notice] = 'Book updated successfully'

      respond_to do |format|
        format.html { redirect_to books_path }
        format.turbo_stream
      end
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy

    respond_to do |format|
      flash[:notice] = 'Book deleted successfully'

      format.html { redirect_to books_path }
      format.turbo_stream
    end
  end

  private

  def find_resource
    @book = Book.find(params[:id])
  end

  def resource_params
    params.require(:book).permit(:title, :isbn, :author_id, :year_published, :price, :available)
  end
end
