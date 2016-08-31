class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  def vote_count
    votes = self.votes
    vote_count = 0
    votes.each do |vote|
      vote_count += vote.value
    end
    vote_count
  end
end
