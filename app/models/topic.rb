# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  name        :string
#  public      :boolean          default(TRUE)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# create_table "topics", force: :cascade do |t|
#   t.string   "name"
#   t.boolean  "public",      default: true
#   t.text     "description"
#   t.datetime "created_at",                 null: false
#   t.datetime "updated_at",                 null: false
# end

class Topic < ActiveRecord::Base

  has_many :posts, dependent: :destroy
  has_many :sponsored_posts, dependent: :destroy
  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
  has_many :ratings, as: :rateable
  has_many :rates, through: :ratings
  
end
