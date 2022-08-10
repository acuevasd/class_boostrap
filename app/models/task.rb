# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  body       :text
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Task < ApplicationRecord
  belongs_to :user

  validates :body, :presence => true

  validates :status, :presence => true

  validates :user, :presence => true
end
