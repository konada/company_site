class BaseViewObject
  include ActionView::Helpers

  def initialize(args = {})
    after_init(args)
  end

  def after_init(args = {})
  end
end
