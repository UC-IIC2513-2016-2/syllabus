class Answer < ApplicationRecord
  # will_vote: boolean
  # voted_past_election: boolean
  # politics_satisfaction: integer
  belongs_to :municipality
  belongs_to :preferred_candidate, class_name: 'Candidate'
end
