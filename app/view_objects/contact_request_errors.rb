class ContactRequestErrors < BaseViewObject
  def html
    error_logic ? (content_tag :div, error_message, class: ["alert alert-danger", "col-xs-12"]) : nil
  end

  private
  attr_reader :form, :attribute, :errors

  def after_init(args = {})
    @form, @attribute = args[:form], args[:attribute]
    @errors = form.errors
  end

  def error_logic
    errors[attribute].any?
  end

  def error_message
    errors.full_messages_for(attribute).first
  end
end
