require "rails_helper"

RSpec.describe CalculatorsController, type: :controller do

  describe 'GET #add' do
    let(:empty_string) {{ "input_string": ""}}
    let(:valid_string1) {{ "input_string": "1"}}
    let(:valid_string2) {{ "input_string": "1,2,3"}}
    let(:valid_string3) {{ "input_string": "0,1,2,0,3"}}
    let(:valid_string4) {{ "input_string": "-0,1,2,-0,3"}}
    let(:valid_string5) {{ "input_string": "1,-2,3"}}
    let(:valid_string6) {{ "input_string": "0,-0,1,-2,3"}}
    let(:valid_string7) {{ "input_string": "0"}}
    let(:valid_string8) {{ "input_string": "-0"}}
    let(:valid_string9) {{ "input_string": "-5"}}
    let(:valid_string10) {{ "input_string": "0,+0,-0"}}
    let(:valid_string11) {{ "input_string": "+1"}}
    let(:valid_string12) {{ "input_string": "-1,-1,-3"}}
    let(:valid_string13) {{ "input_string": "2000,3000,5000"}}
    let(:valid_string14) {{ "input_string": "1, 2, 3, 4"}}
    let(:valid_string15) {{ "input_string": " 1, 2 , 3 , 4 "}}
    let(:valid_string16) {{ "input_string": ",,,1,2,,3,,,4,0,,,"}}
    let(:valid_string17) {{ "input_string": "1,2.5,3.5"}}
    let(:valid_string18) {{ "input_string": "1,-2.5,3.5"}}
    let(:valid_string19) {{ "input_string": "1,0,-0,2.5,3.5"}}


    context 'with empty string input' do
      before { get :add, params: empty_string }
      it 'should return 0 when string is empty' do
        json = JSON.parse(response.body)
        expect(json).to eq(0)
      end
    end

    context 'with non empty string input 1' do
      before { get :add, params: valid_string1 }
      it 'should return 1' do
        json = JSON.parse(response.body)
        expect(json).to eq(1)
      end
    end

    context 'with non empty string input 2' do
      before { get :add, params: valid_string2 }
      it 'should return 6' do
        json = JSON.parse(response.body)
        expect(json).to eq(6)
      end
    end

    context 'with non empty string input 3' do
      before { get :add, params: valid_string3 }
      it 'should return 6' do
        json = JSON.parse(response.body)
        expect(json).to eq(6)
      end
    end

    context 'with non empty string input 4' do
      before { get :add, params: valid_string4 }
      it 'should return 6' do
        json = JSON.parse(response.body)
        expect(json).to eq(6)
      end
    end

    context 'with non empty string input 5' do
      before { get :add, params: valid_string5 }
      it 'should return error' do
        json = JSON.parse(response.body)
        expect(json["error"]).to eq("errorrrr")
      end
    end

    context 'with non empty string input 6' do
      before { get :add, params: valid_string6 }
      it 'should return error' do
        json = JSON.parse(response.body)
        expect(json["error"]).to eq("errorrrr")
      end
    end

    context 'with non empty string input 7' do
      before { get :add, params: valid_string7 }
      it 'should return 0' do
        json = JSON.parse(response.body)
        expect(json).to eq(0)
      end
    end

    context 'with non empty string input 8' do
      before { get :add, params: valid_string8 }
      it 'should return 0' do
        json = JSON.parse(response.body)
        expect(json).to eq(0)
      end
    end

    context 'with non empty string input 9' do
      before { get :add, params: valid_string9 }
      it 'should return error' do
        json = JSON.parse(response.body)
        expect(json["error"]).to eq("errorrrr")
      end
    end

    context 'with non empty string input 10' do
      before { get :add, params: valid_string10 }
      it 'should return 0' do
        json = JSON.parse(response.body)
        expect(json).to eq(0)
      end
    end

    context 'with non empty string input 11' do
      before { get :add, params: valid_string11 }
      it 'should return 1' do
        json = JSON.parse(response.body)
        expect(json).to eq(1)
      end
    end

    context 'with non empty string input 12' do
      before { get :add, params: valid_string12 }
      it 'should return error' do
        json = JSON.parse(response.body)
        expect(json["error"]).to eq("errorrrr")
      end
    end

    context 'with non empty string input 13' do
      before { get :add, params: valid_string13 }
      it 'should return 10000' do
        json = JSON.parse(response.body)
        expect(json).to eq(10000)
      end
    end

    context 'with non empty string input 14' do
      before { get :add, params: valid_string14 }
      it 'should return 10' do
        json = JSON.parse(response.body)
        expect(json).to eq(10)
      end
    end

    context 'with non empty string input 15' do
      before { get :add, params: valid_string15 }
      it 'should return 10' do
        json = JSON.parse(response.body)
        expect(json).to eq(10)
      end
    end

    context 'with non empty string input 16' do
      before { get :add, params: valid_string16 }
      it 'should return 10' do
        json = JSON.parse(response.body)
        expect(json).to eq(10)
      end
    end

    context 'with non empty string input 17' do
      before { get :add, params: valid_string17 }
      it 'should return 7' do
        json = JSON.parse(response.body)
        expect(json).to eq(7)
      end
    end

    context 'with non empty string input 18' do
      before { get :add, params: valid_string18 }
      it 'should return error' do
        json = JSON.parse(response.body)
        expect(json["error"]).to eq("errorrrr")
      end
    end

    context 'with non empty string input 19' do
      before { get :add, params: valid_string18 }
      it 'should return error' do
        json = JSON.parse(response.body)
        expect(json["error"]).to eq("errorrrr")
      end
    end
  end
end