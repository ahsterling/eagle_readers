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

    it 'reformats title attribute when there is not extra space on end' do
      book = Book.new(title: "Volcano : the eruption and healing of Mount St. Helens /")
      book.better_title
      expect(Book.find(book.id).title).to eq "Volcano : the eruption and healing of Mount St. Helens"
    end
  end

  describe '#self.search(attribute, search)' do
    it 'searches for book with dogs in title' do
      book = Book.create(title: "Dogs")
      book2 = Book.create(title: "Cats")
      expect(Book.search("title", "Dogs")).to eq [Book.find(book.id)]
    end
  end
end
