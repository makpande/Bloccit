class Topic < ActiveRecord::Base

  has_many :posts, dependent: :destroy
  belongs_to :sponsoredpost

end
