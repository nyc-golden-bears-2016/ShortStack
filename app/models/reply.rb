class Reply < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :votes, as: :votable

  def points
    total_votes = Vote.where(votable_type: self.class.name, votable_id: self.id)
    total_votes.reduce(0) { |sum, vote| sum + vote.vote_value }
  end

  def age
    ((Time.now - created_at) / 3600).round
  end
end
