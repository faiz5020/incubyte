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
    let(:valid_string20) {{ "input_string": "2.99,2.99,2.99,2.99,2.99,2.99,2.99,2.99,2.99,2.99"}}
    let(:valid_string21) {{ "input_string": "100000000,200000000,900000000"}}

    let(:string_input1) {{ "input_string": "1\n2,3"}}
    let(:string_input2) {{ "input_string": "1\n2\n3"}}
    let(:string_input3) {{ "input_string": "\n1\n2\n3\n"}}
    let(:string_input4) {{ "input_string": "\n\n2\n3\n\n"}}
    let(:string_input5) {{ "input_string": "1\n2\n,3"}}
    let(:string_input6) {{ "input_string": "1\n-2\n,3"}}
    let(:string_input7) {{ "input_string": "1\n0\n,0\n2"}}
    let(:string_input8) {{ "input_string": "1\n0\n,-0\n2"}}
    let(:string_input9) {{ "input_string": "0\n-0"}}
    let(:string_input10) {{ "input_string": "\n\n\n5\n6"}}
    let(:string_input11) {{ "input_string": "\n \n \n5\n6"}}
    let(:string_input12) {{ "input_string": "\n1 \n.5 \n.5\n3"}}

    let(:delimiter_input1) {{ "input_string": "//;\n1;2"}}
    let(:delimiter_input2) {{ "input_string": "//|\n1|2|3|4"}}
    let(:delimiter_input3) {{ "input_string": "//jul\n1jul2jul4jul4"}}
    let(:delimiter_input4) {{ "input_string": "//$\n1$2$3"}}
    let(:delimiter_input5) {{ "input_string": "//.\n1.2.3.4"}}
    let(:delimiter_input6) {{ "input_string": "//7\n17273" }}



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
      before { get :add, params: valid_string19 }
      it 'should return 7' do
        json = JSON.parse(response.body)
        expect(json).to eq(7)
      end
    end

    context 'with non empty string input 20' do
      before { get :add, params: valid_string20 }
      it 'should return 29' do
        json = JSON.parse(response.body)
        expect(json).to eq(29)
      end
    end

    context 'with non empty string input 21' do
      before { get :add, params: valid_string21 }
      it 'should return 1200000000' do
        json = JSON.parse(response.body)
        expect(json).to eq(1200000000)
      end
    end

    context 'with new line string input 1' do
      before { get :add, params: string_input1 }
      it 'should return 6' do
        json = JSON.parse(response.body)
        expect(json).to eq(6)
      end
    end

    context 'with new line string input 2' do
      before { get :add, params: string_input2 }
      it 'should return 6' do
        json = JSON.parse(response.body)
        expect(json).to eq(6)
      end
    end

    context 'with new line string input 3' do
      before { get :add, params: string_input3 }
      it 'should return 6' do
        json = JSON.parse(response.body)
        expect(json).to eq(6)
      end
    end

    context 'with new line string input 4' do
      before { get :add, params: string_input4 }
      it 'should return 5' do
        json = JSON.parse(response.body)
        expect(json).to eq(5)
      end
    end

    context 'with new line string input 5' do
      before { get :add, params: string_input5 }
      it 'should return 6' do
        json = JSON.parse(response.body)
        expect(json).to eq(6)
      end
    end

    context 'with new line string input 6' do
      before { get :add, params: string_input6 }
      it 'should return error' do
        json = JSON.parse(response.body)
        expect(json["error"]).to eq("errorrrr")
      end
    end

    context 'with new line string input 7' do
      before { get :add, params: string_input7 }
      it 'should return 3' do
        json = JSON.parse(response.body)
        expect(json).to eq(3)
      end
    end

    context 'with new line string input 8' do
      before { get :add, params: string_input8 }
      it 'should return 3' do
        json = JSON.parse(response.body)
        expect(json).to eq(3)
      end
    end

    context 'with new line string input 9' do
      before { get :add, params: string_input9 }
      it 'should return 0' do
        json = JSON.parse(response.body)
        expect(json).to eq(0)
      end
    end

    context 'with new line string input 10' do
      before { get :add, params: string_input10 }
      it 'should return 11' do
        json = JSON.parse(response.body)
        expect(json).to eq(11)
      end
    end

    context 'with new line string input 11' do
      before { get :add, params: string_input11 }
      it 'should return 11' do
        json = JSON.parse(response.body)
        expect(json).to eq(11)
      end
    end

    context 'with new line string input 12' do
      before { get :add, params: string_input12 }
      it 'should return 5' do
        json = JSON.parse(response.body)
        expect(json).to eq(5)
      end
    end

    context 'with delimiter input 1' do
      before { get :add, params: delimiter_input1 }
      it 'should return 3' do
        json = JSON.parse(response.body)
        expect(json).to eq(3)
      end
    end

    context 'with delimiter input 2' do
      before { get :add, params: delimiter_input2 }
      it 'should return 10' do
        json = JSON.parse(response.body)
        expect(json).to eq(10)
      end
    end

    context 'with delimiter input 3' do
      before { get :add, params: delimiter_input3 }
      it 'should return 11' do
        json = JSON.parse(response.body)
        expect(json).to eq(11)
      end
    end

    context 'with delimiter input 4' do
      before { get :add, params: delimiter_input4 }
      it 'should return 6' do
        json = JSON.parse(response.body)
        expect(json).to eq(6)
      end
    end

    context 'with delimiter input 5' do
      before { get :add, params: delimiter_input5 }
      it 'should return 10' do
        json = JSON.parse(response.body)
        expect(json).to eq(10)
      end
    end

    context 'with delimiter input 6' do
      before { get :add, params: delimiter_input6 }
      it 'should return 6' do
        json = JSON.parse(response.body)
        expect(json).to eq(6)
      end
    end
  end
end