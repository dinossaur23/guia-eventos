require 'rails_helper'

RSpec.describe SessionsController do
  describe 'POST #create' do
    context 'when has company_params' do
      let(:params) do {
        name: 'Fulano Sono',
        email: 'email@gmail.com',
        password: 'senha123',
        password_confirmation: 'senha123',
        address: 'Rua do Zero',
        number: '0',
        phone_number: '(11)96372-1234',
        document_number: '919.1020.192-12'
      } end

      it 'should create a Company' do
        User.create(params)
        expect(Company.all.count).to eq 1
      end
    end

    context 'when has facebook params' do
      let(:params) do {
        provider: 'facebook',
        uid: 1,
        name: 'Teste Sobrenome',
        email: 'teste@gmail.com',
        photo_url: '123',
        access_token: 'abc1232'
      } end

      it 'should create a Common' do
        User.create(params)
        expect(Common.all.count).to eq 1
      end
    end
  end
end
