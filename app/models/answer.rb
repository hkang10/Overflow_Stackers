class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  validate :empty_string

  def vote_count
    votes = self.votes
    vote_count = 0
    votes.each do |vote|
      vote_count += vote.value
    end
    vote_count
  end

  def empty_string
    if self.text == ""
      errors.add(:message, "Invalid answer input")
    end

  end

end
