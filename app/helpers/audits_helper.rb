module AuditsHelper
  def get_table_number(page, i)
    if page >= 1
      page*10-10+i+1 
    else
      page + i
    end
  end
end
