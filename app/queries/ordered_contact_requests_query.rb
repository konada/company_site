class OrderedContactRequestsQuery
  SORT_OPTIONS = %w(by_subject by_date by_author).freeze

  def initialize(params = {})
    @params = params
  end

  def all
    ContactRequest.public_send(sort_by, direction)
  end

  private

  def sort_by
    @params[:sort_by].to_s.presence_in(SORT_OPTIONS) || :by_date
  end

  def direction
    @params[:direction] == 'asc' ? :asc : :desc
  end
end
