module ApplicationHelper
  def simple_time(time)
    time_d = time + 9.hour
    time_d.strftime("%Y年%m月%d日 %H時%M分")
  end

  def chat_user_names(chat)
    user_names = chat.users.map{|user| user.name}.join(",")
  end
end
