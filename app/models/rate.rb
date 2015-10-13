class Rate < ActiveRecord::Base

  has_many :ratings
  belongs_to :rateable, polymorphic: true
  has_many :topics, through: :ratings, source: :rateable, source_type: :Topic
  has_many :posts, through: :ratings, source: :rateable, source_type: :Post

  def self.update_rates(rating_string)
    new_rates = []

    unless rating_string.nil? || rating_string.empty?
      rating_string.split(",").each do |rating|
        rating_name = rating.strip
        new_rate = Rate.find_or_create_by(name: rating_name)
        new_rates << new_rate
      end
    end
    new_rates
  end
end
