require 'rails_helper'

describe OrderedContactRequestsQuery do
  before do
    create :contact_request, name: 'Lech Wałęsa', subject: 'B'
    create :contact_request, name: 'Adam Małysz', subject: 'C'
    create :contact_request, name: 'Zenon Martyniuk', subject: 'A'
  end

  shared_examples_for 'custom scope' do |sort_by, first_item|
    let(:params) { { sort_by: sort_by } }
    let(:query) { described_class.new(params).all }

    it 'orders items ascending' do
      params[:direction] = 'asc'
      expect(query.first.name).to eq(first_item)
    end

    it 'orders items descending' do
      params[:direction] = 'desc'
      expect(query.last.name).to eq(first_item)
    end
  end

  context 'returns items by author' do
    it_behaves_like 'custom scope', 'by_author','Adam Małysz'
  end

  context 'returns items by date' do
    it_behaves_like 'custom scope', 'by_date', 'Lech Wałęsa'
  end

  context 'returns items by subject' do
    it_behaves_like 'custom scope', 'by_subject', 'Zenon Martyniuk'
  end
end
