# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :bigint           not null
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
