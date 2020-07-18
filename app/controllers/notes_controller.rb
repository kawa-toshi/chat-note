class NotesController < ApplicationController
  
  def index
    @nickname = current_user.nickname
    @notes = current_user.notes.page(params[:page]).per(2)
  end

  def new
    @note = Note.new
  end

  def create
    Note.create!(note_params)
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
  end

  def show
    @nickname = current_user.nickname
    @note = Note.find(params[:id])
  end

  def search
    @nickname = current_user.nickname
    @notes = Note.search(params[:keyword]).page(params[:page]).per(2)
  end

  private
  def note_params
    params.require(:note).permit(:theme, :details).merge(user_id: current_user.id)
  end

end
