module AuditsHelper
  def get_row_number(page, i)
    i = i + 1
    if page >= 1
      ( page * 10 - 10 ) + i
    else
      page *   i
    end
  end
end
