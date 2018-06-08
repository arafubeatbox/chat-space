class MessagesController < ApplicationController
  before_action :set_chat

  def index
    @message = Message.new
    @messages = @chat.messages.includes(:user)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = @chat.messages.new(message_params)
    if @message.save
      respond_to do |format|
      format.html { redirect_to chat_messages_path(@chat), notice: 'メッセージが送信されました'  }
      format.json
      end
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
    @chat = Chat.find(params[:chat_id])
  end
end
