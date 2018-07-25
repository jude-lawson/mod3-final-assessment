class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def player_scores
    [
      {
        user_id: player_1.id,
        score: plays.where(user_id: player_1.id).sum(:score)
      },
      {
        user_id: player_2.id,
        score: plays.where(user_id: player_2.id).sum(:score)
      }
    ]
  end
end
