module ApplicationHelper
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, fenced_code_blocks: true)
    @markdown.render(content).html_safe
  end

  def percentage(number)
    number_to_percentage(number, precision: 1, strip_insignificant_zeros: true)
  end

  def weekday_abbreviation(date)
    day_hash = {"Thursday" => "Th", "Saturday" => "Sa", "Sunday" => "Su"}
    weekday = date.strftime("%A")
    day_hash[weekday] || weekday.first
  end

  def date_abbreviation(datetime)
    datetime.strftime("%m/%d")
  end

  def date_humanized(datetime)
    datetime.to_date.to_formatted_s(:long_ordinal)
  end

  def time_abbreviation(datetime)
    datetime.strftime("%l:%M %p")
  end

  def int_if_possible(number)
    number.to_i == number ? number.to_i : number
  end

  def db_datetime_string(date)
    date.blank? ? "" : date.strftime("%Y-%m-%d %H:%M")
  end

  def back_arrow
    "<i class='fa fa-chevron-left'></i><i class='fa fa-chevron-left'></i> ".html_safe
  end
end
