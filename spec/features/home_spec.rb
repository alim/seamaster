require 'rails_helper'

describe 'the login process' do
  context 'when a user vists the home page' do
    it 'shows them a brief into to Seamaster with a login link' do
      visit '/'

      expect(page).to have_content("Seamaster is a container centric continuous integration and continuous deployment (CI/CD) platform")
      expect(page).to have_link("login")
    end
  end
end
