# == Schema Information
#
# Table name: advertisements
#
#  id         :integer          not null, primary key
#  title      :string
#  copy       :text
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
