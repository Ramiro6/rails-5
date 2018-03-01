class SectionsController < ApplicationController
  def index
    @sections = Seciton.sorted
  end

  def show
    @sections = Seciton.find(params[:id])
  end

  def new
    @sections = Seciton.new
  end

  def create
    @sections = Seciton.new(section_params)
    if @sections.save
      flash[:notice] = "Section created successfully"
      redirect_to section_path
    else
      render 'new'
    end
  end

  def edit
    @sections = Section.find(params[:id])
  end

  def update
    @sections = Section.find(params[:id])

    if @sections.update_attributes(section_params)
      flash[:notice] = "Subject update successfully"
      redirect_to section_path(@sections)
    else
      render 'edit'
    end
  end

  def delete
    @sections = Section.find(params[:id])
  end

  def destroy
    @sections = Section.find(params[:id])
    @sections.destroy
    flash[:notice] = "Section '#{@sections.name}' destroyed successfully"
    redirect_to(subjects_path)
  end

  private
  def section_params
    params.require(:page).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
end
