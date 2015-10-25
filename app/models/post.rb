# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#  user_id    :integer
#  rank       :float
#

class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :labels, through: :labelings
  has_many :labelings, as: :labelable
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  after_create :post_favorite

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
    new_rank = points + age_in_days
    update_attribute(:rank, new_rank)
  end

  def post_favorite
    user.favorites.create(post: self)
  end

  default_scope { order('rank DESC') }
  scope :visible_to, -> (user) { user ? all : joins(:topic).where('topics.public' => true) }
  scope :ordered_by_title, -> { reorder('title ASC') }
  scope :ordered_by_reverse_created_at, -> { reorder('created_at ASC') }
end
