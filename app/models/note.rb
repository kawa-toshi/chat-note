class Note < ApplicationRecord
  belongs_to :user, optional: true
  validates :theme, presence: true, length: { maximum: 30}
  validates :details, presence: true, length: { maximum: 500}
  
  def self.search(search,id) 
    if search
      Note.where(['theme LIKE ?', "%#{search}%"]).where(user_id: id)
    else
      Note.all
    end
   
  end
end
