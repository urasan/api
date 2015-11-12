class DislikesController < ApplicationController
  before_action :find_or_create_message, only: %w(create index)

  def create
    user = User.find_or_create_by(identifier: params[:user_id])

    @message.add_evaluation(:dislike, 1, user)

    return head(:ok)
  end

  def index
    @dislikes = @message.evaluators_for(:dislike)

    render json: @dislikes
  end

  private

  def find_or_create_message
    @message = Message.find_or_create_by(identifier: params[:message_id], thread_id: params[:thread_id])
  end
end
