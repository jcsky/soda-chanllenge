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
class Item < ApplicationRecord
end
