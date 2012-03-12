module ApplicationHelper
  def date_stamp(format, with_time = true)
    stamp = case format
    when :long
      "Sunday, May 1, 2000"
    when :short
      "Mon, Sep. 24"
    else
      fail "That format (#{format}) is not supported."
    end
    with_time ? stamp + " 09:00pm" : stamp
  end

  def flash_class(level)
    case level
    when :success then 'success'
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    end
  end
end
