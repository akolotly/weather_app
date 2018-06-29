require 'rails_helper'
require 'get_weather_helper'

describe 'City pages' do
  let(:forecast_response) { RESPONSE_FORECAST_MOCK }

  before do
    allow(OpenWeather::Forecast)
      .to receive(:geocode)
      .and_return(forecast_response)
  end

  subject { page }

  describe 'Page showing the city' do
    let(:city) { FactoryBot.create(:city) }

    describe 'Page accessibility' do
      before { visit city_path(city) }

      it 'The correct content is displayed' do
        is_expected.to have_title(city.name)
        is_expected.to have_selector('h1', text: city.name)
        is_expected.not_to have_title('Выход')
      end
    end

    describe 'Weather accessibility' do
      before { visit city_path(city) }

      it 'Table availability' do
        is_expected.to have_selector('table')
        is_expected.to have_selector('th', text: 'Дата/Время')
        is_expected.to have_selector('th', text: 'Температура, градусы Цельсия')
        is_expected.to have_selector('th', text: 'Облачность')
        is_expected.to have_selector('th', text: 'Скорость ветра, м/с')
        is_expected.to have_selector('th', text: 'Атмосферное давление, мм рт.ст.')
        is_expected.to have_selector('th', text: 'Влажность, %')

        first_table_row = page.first('tbody tr')
        expect(first_table_row).to have_selector('td', text: 'облачно')
      end
    end
  end

  describe 'All cities page' do
    let!(:city1) { FactoryBot.create(:city) }
    let!(:city2) { FactoryBot.create(:city) }
    let!(:city3) { FactoryBot.create(:city) }

    describe 'Page accessibility' do
      before { visit cities_path }

      it 'The correct content is displayed' do
        is_expected.to have_title('Cities')
        is_expected.to have_selector('h1', text: 'Города')
      end

      it 'Should list each cities' do
        is_expected.to have_selector('li', text: city1.name)
        is_expected.to have_selector('li', text: city2.name)
        is_expected.to have_selector('li', text: city3.name)

        is_expected.to have_link('Узнать погоду')
      end
    end
  end
end
