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

  describe '#better_title' do
    it 'reformats title attribute to remove extra punctuation' do
      book = Book.new(title: "Martin the Warrior / ")
      book.better_title
      expect(Book.find(book.id).title).to eq "Martin the Warrior"
    end
  end
end
