class DislikesController < ApplicationController
  before_action :find_or_create_message, only: %w(create index destroy)

  def create
    @message.dislike!(User.find_or_create_by(identifier: params[:user_id]))

    return head(:ok)
  end

  def index
    @dislikes = @message.dislikes

    render json: @dislikes
  end

  def destroy
    @message.destroy_dislike!(User.find_or_create_by(identifier: params[:user_id]))

    return head(:ok)
  end

  private

  def find_or_create_message
    @message = Yammer::Message.find_or_create_by(identifier: params[:message_id], thread_id: params[:thread_id])
  end
end
