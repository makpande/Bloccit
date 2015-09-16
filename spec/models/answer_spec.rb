# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  body        :text
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { Question.create!(title: "New Question Title ", body: "New Question Body") }
  let(:answer)  { Answer.create!(body: "Answer Body", question: question)}

  describe "attributes" do
    it "should respond to body" do
      expect(answer).to respond_to(:body)
    end
  end
end
