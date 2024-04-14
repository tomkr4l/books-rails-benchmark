class AuthorsController < ApplicationController
  before_action :find_resource, only: [:edit, :update, :destroy]

  def index
    @q = Author.ransack(params[:q])
    @q.sorts = 'id DESC' if @q.sorts.empty?
    @pagy, @authors = pagy(@q.result)
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(resource_params)

    if @author.save
      flash[:notice] = 'Author created successfully'
      respond_to do |format|
        format.html { redirect_to authors_path }
        format.turbo_stream
      end
    else
      render 'new'
    end
  end

  def update
    if @author.update(resource_params)
      flash[:notice] = 'Author updated successfully'

      respond_to do |format|
        format.html { redirect_to authors_path }
        format.turbo_stream
      end
    else
      render 'edit'
    end
  end

  def destroy
    @author.destroy

    respond_to do |format|
      flash[:notice] = 'Author deleted successfully'

      format.html { redirect_to authors_path }
      format.turbo_stream
    end
  end

  private

  def resource_params
    params.require(:author).permit(:name, :birth, :death)
  end

  def find_resource
    @author = Author.find(params[:id])
  end
end
