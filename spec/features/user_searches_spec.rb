require 'rails_helper'

RSpec.feature 'user searches', type: :feature do
  scenario 'User searches for Nopales' do
    visit root_path

    check 'Nopales'
    click_button 'Search'

    expect(page).to have_text('Jeanette\'s Tacos')
    expect(page).to have_text('Shivering Cactus Tacos')
    expect(page).to have_text('California Market')
    expect(page).to have_text('Reyes Market')
    expect(page).to have_text('Don Roge')
  end

  scenario 'User searches for Habeñero' do
    visit root_path

    check 'Habeñero'
    click_button 'Search'

    expect(page).to have_text('Juan\'s Tacos')
    expect(page).to have_text('Lily\'s Tacos')
    expect(page).to have_text('La Super Rica')
    expect(page).to have_text('Reyes Market')
    expect(page).to have_text('Don Roge')
  end

  scenario 'User searches for Nopales and Habeñero' do
    visit root_path

    check 'Nopales'
    check 'Habeñero'
    click_button 'Search'

    expect(page).to have_text('Reyes Market')
    expect(page).to have_text('Don Roge')

    expect(page).to_not have_text('Jeanette\'s Tacos')
    expect(page).to_not have_text('Shivering Cactus Tacos')
    expect(page).to_not have_text('California Market')
    expect(page).to_not have_text('Juan\'s Tacos')
    expect(page).to_not have_text('Lily\'s Tacos')
    expect(page).to_not have_text('La Super Rica')
  end

  scenario 'User searches for all taco types' do
    visit root_path

    check 'all_tacos'
    click_button 'Search'

    Store.includes(:tacos).all.each do |store|
      expect(page).to have_text(store.name)
      expect(page).to have_text(store.city.name)
    end
  end

  scenario 'User searches for all salsa types' do
    visit root_path

    check 'all_salsas'
    click_button 'Search'

    Store.includes(:salsas).all.each do |store|
      expect(page).to have_text(store.name)
      expect(page).to have_text(store.city.name)
    end
  end
end
