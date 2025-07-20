require "rails_helper"

RSpec.describe CalculatorsController, type: :controller do

  describe 'GET #add' do
    let(:empty_string) {{ "input_string": ""}}
    context 'with empty string input' do
      before { get :add, params: empty_string }
      it 'should return 0 when string is empty' do
        json = JSON.parse(response.body)
        expect(json).to eq(0)
      end
    end
  end
end