class BaseViewObject
  attr_reader :context

  include Rails.application.routes.url_helpers
  include ActionView::Helpers
  include ActionView::Context

  def initialize(context, args = {})
    @context = context
    after_init(args)
  end

  def after_init(args = {})
    # implemented by child classes
  end
end
