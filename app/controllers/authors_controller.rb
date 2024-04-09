class AuthorsController < ApplicationController
  def index
    @q = Author.ransack(params[:q])
    @q.sorts = 'id DESC' if @q.sorts.empty?
    @pagy, @authors = pagy(@q.result)
  end

  def new
    @author = Author.new
  end

  def create
  end

  private

  def resource_params
    params.require(:author).permit(:name, :birth, :death)
  end
end
