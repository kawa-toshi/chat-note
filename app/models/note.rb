class Note < ApplicationRecord
  belongs_to :user, optional: true

  def self.search(search)
    return Note.find(params[:user_id]) unless search
    Note.where('theme LIKE(?)', "%#{search}%")
  end
end
