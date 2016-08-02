require 'rails_helper'

RSpec.feature 'A visitor can search for stores by zip' do
  context 'valid' do
    scenario 'They visit the homepage and enter a zip code' do
      visit '/'
      fill_in 'zip', with: '80202'
      click_on 'search'

      expect(current_path).to eq '/search'

      within "#results" do
        expect(page).to have_content "17 Total Stores"

        expect(page).to have_content "Long Name"
        expect(page).to have_content "City"
        expect(page).to have_content "Distance"
        expect(page).to have_content "Phone Number"
        expect(page).to have_content "Store Type"

        expect(page).to have_selector ('.results', count: 12)

        within "#result-1" do
          expect(page).to have_content ""
          expect(page).to have_content ""
          expect(page).to have_content ""
          expect(page).to have_content ""
          expect(page).to have_content ""
        end
      end
    end
  end
end
