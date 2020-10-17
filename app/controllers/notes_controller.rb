class NotesController < ApplicationController
  
  def index
    @nickname = current_user.nickname
    sort = params[:sort] || "created_at DESC"
    @notes = current_user.notes.includes(:user).page(params[:page]).per(2).order(sort)
    
    if params[:option] == "created_at_desc" || params[:option] == nil
      @notes = current_user.notes.includes(:user).page(params[:page]).per(2).order('created_at DESC')
    elsif params[:option] == "created_at_asc"    
      @notes = current_user.notes.includes(:user).page(params[:page]).per(2).order('created_at ASC')
    end
  end

  def new
    @note = Note.new
  end

  def create

    @note = Note.new(note_params)
    if @note.save
      flash[:notice] = "ノートが作成されました"
      redirect_to controller: :notes, action: :index
    else
      render "new"
    end
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
    # note = Note.find(params[:id])
    # note.update(note_params)
    # flash[:notice] = "ノートは更新されました"
    # redirect_to root_path
    @note = Note.find(params[:id])
    if @note.update(note_params)
      flash[:notice] = "ノートが更新されました"
      redirect_to controller: :notes, action: :index
    else
      render "edit"
    end
  end

  def show
    @nickname = current_user.nickname
    @note = Note.find(params[:id])
  end

  def search
    @nickname = current_user.nickname
    @id = current_user.id
    sort = params[:sort] || "created_at DESC"
    @notes = Note.search(params[:keyword], current_user.id).page(params[:page]).per(2).order(sort)
    
    # sort = params[:sort] || "created_at DESC"
    # @notes = current_user.notes.includes(:user).page(params[:page]).per(2).order(sort)
    
    
  end

  private
  def note_params
    params.require(:note).permit(:theme, :details).merge(user_id: current_user.id)
  end

end
