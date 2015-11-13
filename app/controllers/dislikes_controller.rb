class DislikesController < ApplicationController
  before_action :find_or_create_thread_and_message, only: %w(create index destroy)

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

  def find_or_create_thread_and_message
    thread = Yammer::Thread.find_or_create_by(yammer_id: params[:thread_id])

    @message = Yammer::Message.find_or_create_by(yammer_id: params[:message_id], thread: thread)
  end
end
