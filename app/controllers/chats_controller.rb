class ChatsController < ApplicationController
  before_action :set_chat, only: [:edit, :update]

  def index
    @message = Message.new
    @messages = @chat.messages.includes(:user) if @chat
  end

  def new
    @chat = Chat.new
    @chat.users << current_user
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to root_path, notice: 'チャットを作成しました'
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @chat.update(chat_params)
      redirect_to chats_messages_path(@chat), notice: 'チャットを編集しました'
    else
      render :edit
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:name, { :user_ids => [] })
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end
end
