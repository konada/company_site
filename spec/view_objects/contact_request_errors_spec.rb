require 'spec_helper'

describe ContactRequestErrors do
  subject { ContactRequestErrors.new(context, form: form, attribute: attribute) }
  let(:context) { double }
  let(:attribute) { :name }
  let(:error_message) { "Name cannot be blank!" }

  describe '#html' do
    context 'when form has errors' do
      let(:form) do
        double(errors: { attribute => ["Name cannot be blank!"] })
      end
      it 'returns correct html' do
        allow(subject).to receive(:error_message).and_return(error_message)
        correct_html = '<div class="alert alert-danger col-xs-12">Name cannot be blank!</div>'

        expect(subject.html).to eq correct_html
      end
    end

    context 'when form does not have any errors' do
      let(:form) do
        double(errors: { attribute => [] })
      end
      it 'returns nil' do
        expect(subject.html).to eq nil
      end
    end
  end
end
