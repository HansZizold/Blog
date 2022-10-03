require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'Index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Number of posts')
    end
  end
end
