module ChecklistsHelper
  def checked_checkbox
    @checklist.publish == true ? 'checked="checked"' : ''
  end
end
