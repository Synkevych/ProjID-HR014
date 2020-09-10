module ChecklistsHelper
  def checked_checkbox
    @checklist.publish == true ? 'checked="checked"' : ''
  end

  def publish_name
    @checklist.publish ? 'Published' : 'Publish'
  end
end
