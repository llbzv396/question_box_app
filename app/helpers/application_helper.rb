module ApplicationHelper
  def full_title(title)
    if title.blank?
      "脳トレ！"
    else
      "#{title} | 脳トレ！"
    end
  end
end
