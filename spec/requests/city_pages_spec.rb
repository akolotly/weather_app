require 'rails_helper'

describe 'City pages' do
  subject { page }

  describe 'Page showing the city' do
    let(:city) { FactoryBot.create(:city) }

    describe 'Page accessibility' do
      before { visit city_path(city) }

      it { is_expected.to have_title(city.name) }
      it { is_expected.to have_selector('h1', city.name) }
    end
  end

  describe 'All cities page' do
    let!(:city1) { FactoryBot.create(:city) }
    let!(:city2) { FactoryBot.create(:city) }
    let!(:city3) { FactoryBot.create(:city) }

    describe 'Page accessibility' do
      before { visit cities_path }

      it { is_expected.to have_title('Cities') }
      it { is_expected.to have_selector('h1', text: 'Города') }

      it 'Should list each cities' do
        is_expected.to have_selector('li', text: city1.name)
        is_expected.to have_selector('li', text: city2.name)
        is_expected.to have_selector('li', text: city3.name)

        is_expected.to have_link('Узнать погоду')
      end
    end
  end
end
