# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def formatted_date value
    return "#{value.mday}.#{value.mon}.#{value.year}"
  end
  
  def approved value
    if !value
      ' approved'
    end
  end
  
end
