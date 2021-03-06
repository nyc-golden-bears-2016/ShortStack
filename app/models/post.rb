class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable, dependent: :destroy
  has_many :replies, dependent: :destroy

  def points
    total_votes = Vote.where(votable_type: self.class.name, votable_id: self.id)
    total_votes.reduce(0) { |sum, vote| sum + vote.vote_value }
  end

  def age
    ((Time.now - created_at) / 3600).round
  end
end
