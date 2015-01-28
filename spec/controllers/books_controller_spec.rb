require 'rails_helper'

describe BooksController do
  it 'populates an array of messages' do
    book = Book.create(title: "The Great Gatsby")
    get :index
    expect(assigns(:books)).to match_array [book]
  end

  it 'renders the #index view' do
    get :index
    expect(response).to render_template :index
  end
end