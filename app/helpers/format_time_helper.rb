module FormatTimeHelper
  def format_time(date)
    date.strftime("%a, %d %B %H:%M:%S %Z")
  end
end