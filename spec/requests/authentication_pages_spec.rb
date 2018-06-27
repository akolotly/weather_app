require 'rails_helper'

describe 'Authentication' do
  subject { page }

  describe 'Login page' do
    before { visit login_path }

    it { is_expected.to have_content('Вход') }
    it { is_expected.to have_title('Вход') }
  end

  describe 'Login' do
    before { visit login_path }

    context 'With invalid information' do
      before { click_button 'Войти' }

      it { is_expected.to have_title('Вход') }
      it { is_expected.not_to have_title('Выход') }
    end

    context 'With valid information' do
      let(:user) { FactoryBot.create(:user, password: '123456') }
      before { sign_in user }

      it { is_expected.to have_title('Dashboard') }
      it { is_expected.to have_link('Users', href: admin_users_path) }
      it { is_expected.to have_link('Cities', href: admin_cities_path) }
      it { is_expected.to have_link('Logout', href: logout_path) }
      it { is_expected.not_to have_link('Вход', href: login_path) }
    end
  end

  describe 'Authorization' do
    describe 'For non-signed-in users' do
      let(:user) { FactoryBot.create(:user) }

      context 'When attempting to visit a protected page' do
        before { visit admin_users_path }

        it { expect(page).to have_title('Cities') }
        it { expect(page).to have_selector('h1', text: 'Города') }
      end

      context 'When visit login page' do
        before do
          visit login_path
          sign_in user
          visit login_path
        end

        it { is_expected.to have_title('Dashboard') }
      end
    end
  end
end

def sign_in(user)
  visit login_path
  fill_in 'Логин', with: user.email
  fill_in 'Пароль', with: '123456'
  click_button 'Войти'
end
