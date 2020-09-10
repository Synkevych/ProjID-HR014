module ChecklistsHelper
  def checked_checkbox
    @checklist.publish == true ? 'checked="checked"' : ''
  end

  def publish_name
    @checklist.publish ? 'Published' : 'Publish'
  end
  def show_total_pages(current_page, total_pages)
    string = "Showing "
    if current_page > 1
      string += (current_page*10-9).to_s
    else 
      string << "1"
    end
    string << " to " << (current_page*10).to_s << " of " << total_pages.to_s << " entries"
  end
end
