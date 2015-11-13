module Yammer
  class Message < ActiveRecord::Base
    has_reputation :dislike, source: :user, aggregated_by: :sum

    def destroy_dislike!(user)
      delete_evaluation(:dislike, user)
    end

    def dislike!(user)
      add_evaluation(:dislike, 1, user)
    end

    def dislikes
      evaluators_for(:dislike)
    end
  end
end
