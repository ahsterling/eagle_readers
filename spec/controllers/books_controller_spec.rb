require 'rails_helper'

describe BooksController do

  let(:book) {Book.create(title: "The Great Gatsby")}
  describe 'GET #index' do
    it 'populates an array of messages' do
      get :index, search: nil, attribute: nil
      expect(assigns(:books)).to match_array [book]
    end

    it 'renders the #index view' do
      get :index, search: nil, attribute: nil
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns requested book to @book' do
      get :show, id: book
      expect(assigns(:book)).to eq book
    end

    it 'renders the show template' do
      get :show, id: book
      expect(response).to render_template :show
    end
  end
end
