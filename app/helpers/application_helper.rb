module ApplicationHelper

  def friendly_time(time)
    if time.to_date == Date.today
      time.strftime('%l:%M%P')
    else
      time.strftime('%b %-d')
    end
  end
end
