module ApplicationHelper
  def bootstrap_alert_message_class_for(flash_type)
    flash_alert_map = HashWithIndifferentAccess.new({
      success: 'success',
      error: 'danger',
      notice: 'info',
      warning: 'warning'
    })
    flash_alert_map[flash_type]
  end
end
