require 'rails_helper'

RSpec.describe Store, type: :model do

  it 'correctly returns stores from tacos search' do
    tacos_search = Store.search_by_tacos('Veggie')
    expect(tacos_search.size).to eq(5)
    expect(tacos_search.map(&:name)).to eq([
      'Jeanette\'s Tacos',
      'Lily\'s Tacos',
      'Shivering Cactus Tacos',
      'Lily\'s Tacos',
      'Rincon Alteño'
    ])
  end

  it 'correctly returns stores from salsas search' do
    salsas_search = Store.search_by_salsas('Salsa Don Roge')
    expect(salsas_search.size).to eq(1)
    expect(salsas_search.map(&:name)).to eq([
      'Don Roge'
    ])
  end

  it 'correctly returns all stores when searching all taco types' do
    tacos_search = Store.search_by_tacos('all')
    expect(tacos_search.size).to eq(17)
  end

  it 'correctly returns all stores when searching all salsa types' do
    salsas_search = Store.search_by_salsas('all')
    expect(salsas_search.size).to eq(17)
  end
end
