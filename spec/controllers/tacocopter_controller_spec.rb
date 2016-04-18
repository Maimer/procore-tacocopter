require 'rails_helper'

RSpec.describe TacocopterController, type: :controller do

  describe 'GET #index' do
    it 'assigns all tacos to @tacos' do
      tacos = Taco.all
      get :index
      expect(assigns(:tacos)).to eq(tacos)
    end
    it 'assigns all salsas to @salsas' do
      salsas = Salsa.all
      get :index
      expect(assigns(:salsas)).to eq(salsas)
    end
    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'should display results if params given' do
      get :show, id: '', 'taco' => ['Lobster Alfredo'], 'salsa' => ['Pico de Gallo']
      expect(response).to be_ok
      expect(assigns(:stores).map(&:name)).to eq([
        'Archibald\'s Bistro',
      ])
    end
    it 'should redirect to the index if no search params given' do
      get :show, id: ''
      expect(response).to redirect_to(action: :index)
    end
  end
end
