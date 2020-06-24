# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  comment      :text
#  completed_at :datetime
#  deadline_at  :datetime
#  star         :boolean          default(FALSE)
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
