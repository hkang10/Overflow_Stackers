class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, :as => :voteable
  has_many :comments, :as => :commentable

  def vote_count
    votes = self.votes
    vote_count = 0
    votes.each do |vote|
      vote_count += vote.value
    end
    vote_count
  end

end
