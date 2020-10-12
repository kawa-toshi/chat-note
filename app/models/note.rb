class Note < ApplicationRecord
  belongs_to :user, optional: true

  def self.search(search,id)
    
    # return Note.find(params[:user_id]) unless search
    # Note.where('theme LIKE(?)', "%#{search}%")
    
    if search
      Note.where(['theme LIKE ?', "%#{search}%"]).where(user_id: id)
    else
      Note.all
    end
   
  end
end
