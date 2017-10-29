require 'rails_helper'

describe ContactRequestErrors do
  subject { described_class.new(form: form, attribute: :name) }

  shared_examples_for 'contact request errors #html' do |error = nil, html = nil|
    let(:form) do
      form = ContactRequest.new
      form.errors[:name] = error unless error.nil?
      form
    end

    it 'returns correct html' do
      expect(subject.html).to eq html
    end
  end

  context 'when form has errors' do
    it_behaves_like 'contact request errors #html',
                    'is invalid!',
                    '<div class="alert alert-danger col-xs-12">Name is invalid!</div>'
  end

  context 'when form does not have any errors' do
    it_behaves_like 'contact request errors #html'
  end
end
