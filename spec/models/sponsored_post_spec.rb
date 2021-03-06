# == Schema Information
#
# Table name: sponsored_posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#

require 'rails_helper'
include RandomData

RSpec.describe SponsoredPost, type: :model do
  let(:sponsoredpost) { SponsoredPost.create!(title: "New SponsoredPost Title", body: "New SponsoredPost Body") }

  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
   let(:sponsoredpost) { topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  it { should belong_to(:topic)}


  describe "attributes" do

    it "should respond to title" do
      expect(sponsoredpost).to respond_to(:title)
    end

    it "should respond to body" do
      expect(sponsoredpost).to respond_to(:body)
    end

    it "should respond to price" do
      expect(sponsoredpost).to respond_to(:price)
    end
  end
end
