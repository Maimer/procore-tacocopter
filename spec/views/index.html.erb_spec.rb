require 'rails_helper'

RSpec.describe 'tacocopter/index', type: :view do

  before(:each) do
    @tacos = Taco.all
    @salsas = Salsa.all
    assign(:tacos, @tacos)
    assign(:salsas, @salsas)
  end

  it 'displays all the taco types' do
    render

    expect(rendered).to have_content('Select Tacos to Find:')
    @tacos.each do |taco|
      expect(rendered).to have_content(taco.name)
    end
    expect(rendered).to have_content('<one for each taco in the seed file>')
  end

  it 'displays all the salsa types' do
    render

    expect(rendered).to have_content('Select Sauces to Find:')
    @salsas.each do |salsa|
      expect(rendered).to have_content(salsa.name)
    end
    expect(rendered).to have_content('<one for each sauce in the seed file>')
  end

  it 'contains correct title and a search button' do
    render

    expect(rendered).to have_title('Santa Barbara Tacocopter')
    expect(rendered).to have_button('Search')
  end
end
