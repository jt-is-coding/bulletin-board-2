# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Board < ApplicationRecord
  validates(:name, presence: true, uniqueness: true)

  def username
    matching_users = User.where({ :id => self.user_id })
    the_user = matching_users.at(0)
    return the_user.email
  end
end
