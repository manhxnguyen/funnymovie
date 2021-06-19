class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  enum reaction_type: [:vote, :unvote]

  scope :who_voted, ->(user_id) {where(user_id: user_id)}
end
