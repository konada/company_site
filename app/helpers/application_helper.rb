module ApplicationHelper
  def view_object(name, args = {})
    class_name = name.to_s.titleize.split(' ').join('')
    class_name.constantize.new(args)
  end
end
