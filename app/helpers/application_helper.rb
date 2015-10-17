module ApplicationHelper
  def show_nothing(things)
    render "common/nothing" if things.blank?
  end
end
