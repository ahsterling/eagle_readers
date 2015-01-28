require 'rails_helper'

describe Book do
  describe '.validations' do
    it 'is valid with title' do
      book = Book.new(title: "The Great Gatsby")
      expect(book).to be_valid
    end
  end
end
