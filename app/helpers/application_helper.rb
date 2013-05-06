module ApplicationHelper
  def resource
    @resource ||= User.new
  end

  def resource_name
    :user
  end
end
