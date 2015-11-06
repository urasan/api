class Message < ActiveRecord::Base
  has_reputation :dislike, source: :user, aggregated_by: :sum
end
