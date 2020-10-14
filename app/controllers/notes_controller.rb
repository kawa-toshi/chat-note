class NotesController < ApplicationController
  
  def index
    @nickname = current_user.nickname
    @notes = current_user.notes.includes(:user).page(params[:page]).per(2).order("created_at DESC")
  end

  def new
    @note = Note.new
  end

  def create
    Note.create!(note_params)
    flash[:notice] = "ノートが作成されました"
    redirect_to root_path
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    flash[:notice] = "ノートは削除されました"
    redirect_to root_path
  end


  def edit
    @note = Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    flash[:notice] = "ノートは更新されました"
    redirect_to root_path
  end

  def show
    @nickname = current_user.nickname
    @note = Note.find(params[:id])
  end

  def search
    @nickname = current_user.nickname
    @id = current_user.id
    
    @notes = Note.search(params[:keyword], current_user.id).page(params[:page]).per(2)
    
    
    
  end

  private
  def note_params
    params.require(:note).permit(:theme, :details).merge(user_id: current_user.id)
  end

end
