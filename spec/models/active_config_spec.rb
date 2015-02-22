require 'rails_helper'

RSpec.describe ActiveConfig, type: :model do

  before :example do
    Rails.cache.clear
  end

  describe '[]=' do

    describe 'When value is of String type' do

      before :example do
        ActiveConfig[:name] = 'Ismail'
        @config = ActiveConfig.find_by(key: :name)
      end

      it 'sets type to string' do
        expect(@config.type).to eq 'String'
      end
    end

    describe 'When value is of Float type' do

      before :example do
        ActiveConfig[:amount] = 23.5
        @config = ActiveConfig.find_by(key: :amount)
      end

      it 'sets type to float' do
        expect(@config.type).to eq 'Float'
      end
    end

    describe 'When value is of Integer type' do

      before :example do
        ActiveConfig[:number] = 23
        @config = ActiveConfig.find_by(key: :number)
      end

      it 'sets type to integer' do
        expect(@config.type).to eq 'Integer'
      end
    end

    describe 'When value is of Boolean type' do

      before :example do
        ActiveConfig[:playing] = true
        @config = ActiveConfig.find_by(key: :playing)
      end

      it 'sets type to true class' do
        expect(@config.type).to eq 'Boolean'
      end
    end
  end


  describe '[]' do

    describe 'When type is String' do
      before :example do
        @config = create(:active_config)
        Rails.cache.delete(@config.key)
      end

      it 'returns email as string type' do
        expect(ActiveConfig[:email]).to be_instance_of(String)
      end
    end

    describe 'When type is Integer' do

      before :example do
        @config = create(:active_config, key: :count, value: '10', type: 'Integer')
      end

      it 'returns count as integer type' do
        expect(ActiveConfig[:count]).to be_kind_of(Integer)
      end
    end

    describe 'When Type is Float' do
      context 'Float' do
        before :example do
          @config = create(:active_config, key: :balance, value: '350.54', type: 'Float')
        end

        it 'returns balance as float type' do
          expect(ActiveConfig[:balance]).to be_kind_of(Float) 
        end
      end
    end

    describe 'When type is Boolean' do
      context 'True' do
        before :example do
          @config = create(:active_config, key: :enable, value: 'true', type: 'Boolean')
        end

        it 'returns blance as boolean true' do
          expect(ActiveConfig[:enable]).to be_instance_of(TrueClass)
        end
      end

      context 'False' do
        before :example do
          @config = create(:active_config, key: :enable, value: 'false', type: 'Boolean')
        end

        it 'returns enable as boolean false' do
          expect(ActiveConfig[:enable]).to be_instance_of(FalseClass)
        end
      end
    end

  end

end
