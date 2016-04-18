require 'rails_helper'

RSpec.describe 'tacocopter/show', type: :view do

  before(:each) do
    @stores = Store.all
    assign(:stores, @stores)
  end

  it 'displays correct title and all the store names and cities' do
    render

    expect(rendered).to have_title('Santa Barbara Tacocopter | Stores')
    expect(rendered).to have_content('Stores matching your requirements:')
    @stores.each do |store|
      expect(rendered).to have_content(store.name)
      expect(rendered).to have_content(store.city.name)
    end
  end
end
