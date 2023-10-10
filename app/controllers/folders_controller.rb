class FoldersController < ApplicationController

  def index
    folders = Folder.all
    render locals: { folders: folders }
  end

  def new
    folder = Folder.new
    render locals: { folder: folder }
  end

  def create
    folder = Folder.new(folder_params)

    if folder.save
      flash[:success] = 'Folder has been successfully created'
      redirect_to folders_path
    else
      render :new, locals: { folder: folder }
    end
  end

  def edit
    folder = Folder.find_by(id: params[:id])
    render locals: { folder: folder }
  end

  def update
    folder = Folder.find(params[:id])
    if folder.update(folder_params)
      flash[:success] = 'Folder has been successfully updated'
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(folder, partial: 'folders/shared/show', locals: { folder: folder }) }
        format.html { redirect_to folders_path }
      end
    else
      flash[:error] = 'Updating error'
      render :edit, locals: { folder: folder }
    end
  end

  def show
    folder = Folder.find(params[:id])
    render locals: { folder: folder }
  end

  def destroy
    folder = Folder.find(params[:id])
    render locals: { folder: folder }
    # folder.destroy
  end

  private

  def folder_params
    params.require(:folder).permit(:title, :description)
  end
end
