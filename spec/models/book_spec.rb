require 'rails_helper'

describe Book do
  describe '.validations' do
    it 'is valid with title' do
      book = Book.new(title: "The Great Gatsby")
      expect(book).to be_valid
    end

    it 'is invalid without title' do
      expect(Book.new(title: nil)).to be_invalid
    end
  end
end
