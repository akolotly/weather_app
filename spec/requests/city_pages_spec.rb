# require 'rails_helper'

# describe 'Book pages' do
#   subject { page }

#   describe 'Create new book' do
#     describe 'Page accessibility' do
#       before { visit new_book_path }

#       it 'Displays correct content' do
#         is_expected.to have_selector('h1', text: 'Внесение книги в каталог')
#         is_expected.to have_title('New book')

#         is_expected.to have_selector('form#new_book')
#         is_expected.to have_selector('label', text: 'Заголовок книги')
#         is_expected.to have_selector('input[name="book[title]"]')
#       end
#     end

#     describe 'Create action' do
#       before { visit new_book_path }

#       let(:submit) { 'Создать книгу' }

#       describe 'With invalid information' do
#         context 'Form fields are not filled' do
#           it 'Should not create a book' do
#             expect { click_button submit }.not_to change(Book, :count)
#           end
#         end

#         context 'After submission' do
#           before { click_button submit }

#           it { is_expected.to have_title('New book') }
#           it { is_expected.to have_content('Ошибка') }
#         end
#       end

#       describe 'With valid information' do
#         before { fields_valid_book_information }

#         it 'Should create a book' do
#           expect { click_button submit }.to change(Book, :count).by(1)
#         end

#         context 'After saving the book' do
#           before { click_button submit }

#           it { is_expected.to have_title('Алиса в зазеркалье') }
#           it { is_expected.to have_selector('h1', 'Алиса в зазеркалье') }
#           it { is_expected.to have_selector('div.alert.alert-success', text: 'Книга добавлена в каталог!') }
#         end
#       end
#     end
#   end

#   describe 'Page showing the book' do
#     let(:book) { FactoryBot.create(:book) }

#     describe 'Page accessibility' do
#       before { visit book_path(book) }

#       it { is_expected.to have_title(book.title) }
#       it { is_expected.to have_selector('h1', book.title) }
#     end
#   end

#   describe 'Edit information book' do
#     let(:book) { FactoryBot.create(:book) }

#     describe 'Page accessibility' do
#       before { visit edit_book_path(book) }

#       it 'Displays the correct content' do
#         is_expected.to have_title('Edit book')
#         is_expected.to have_selector('h1', text: 'Редактирование книги')
#       end

#       it 'Should render the form' do
#         is_expected.to have_selector('label', text: 'Заголовок книги')
#       end
#     end

#     describe 'Update action' do
#       before { visit edit_book_path(book) }

#       context 'With invalid information' do
#         before do
#           fill_in 'Заголовок книги', with: ''
#           click_button 'Сохранить изменения'
#         end

#         it { should have_content('Ошибка') }
#       end

#       context 'With valid information' do
#         let(:new_title) { 'Alice Through the Looking Glass' }
#         before do
#           fill_in 'Заголовок книги', with: new_title
#           click_button 'Сохранить изменения'
#         end

#         it 'Should show new book title' do
#           is_expected.to have_title(new_title)
#           is_expected.to have_selector('div.alert.alert-success', text: 'Книга отредактирована!')
#           expect(book.reload.title).to eq new_title
#         end
#       end
#     end
#   end

#   describe 'All books page' do
#     let!(:book1) { FactoryBot.create(:book) }
#     let!(:book2) { FactoryBot.create(:book) }
#     let!(:book3) { FactoryBot.create(:book) }

#     describe 'Page accessibility' do
#       before { visit books_path }

#       it { is_expected.to have_title('Books') }
#       it { is_expected.to have_selector('h1', text: 'Все книги') }

#       it { is_expected.to have_selector('label', text: 'Название книги:') }
#       it { is_expected.to have_selector('input[name="search[title]"]') }

#       it 'Should list each user' do
#         is_expected.to have_selector('li', text: book1.title)
#         is_expected.to have_selector('li', text: book2.title)
#         is_expected.to have_selector('li', text: book3.title)

#         is_expected.to have_link('редактировать', href: edit_book_path(book1))
#       end
#     end

#     describe 'Delete links' do
#       before { visit books_path }

#       it { is_expected.to have_link('удалить', href: book_path(book1)) }
#       it 'Should be able to delete another book' do
#         expect do
#           click_link('удалить', match: :first)
#         end.to change(Book, :count).by(-1)
#       end
#     end
#   end
# end

# def fields_valid_book_information
#   fill_in 'Заголовок книги', with: 'Алиса в зазеркалье'
# end
