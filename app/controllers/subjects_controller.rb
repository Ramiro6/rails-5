class SubjectsController < ApplicationController
  def index
    @subjects = Subject.sorted
  end

  def show
    @subjects = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({ name: 'default' })
  end

  def create
    @subejct = Subject.new(subject_params)
    if @subejct.save
      redirect_to subjects_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
