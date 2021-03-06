class PagesController < ApplicationController
  # before_action :find_subjects only: [:new, :create, :edit, :update]
  # before_action :set_page_count only: [:edit]

  def index
    @pages = Page.sorted
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to page_path
    else
      render 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(subject_params)
      flash[:notice] = "Subject update successfully"
      redirect_to subjects_path(@page)
    else
      render 'edit'
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' destroyed successfully"
    redirect_to(subjects_path)
  end

  private
  def page_params
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end

  def find_subjects
    # @subjects = Subject.sorted
  end

  def set_page_count
    
  end
end
