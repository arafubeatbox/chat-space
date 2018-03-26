class MessagesController < ApplicationController
  before_action :set_chat

  def index
    @message = Message.new
    @messages = @chat.messages.includes(:user)
  end

  def create
    @message = @chat.messages.new(message_params)
    if @message.save
      redirect_to chats_messages_path(@chat), notice: 'メッセージが送信されました'
    else
      @messages = @chat.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:message, :image).merge(user_id: current_user.id)
  end

  def set_chat
    if params[:message]
      p = params[:message]
      @chat = Chat.find(p[:chat_id])
    else
      @chat = Chat.find(params[:format])
    end
  end
end
