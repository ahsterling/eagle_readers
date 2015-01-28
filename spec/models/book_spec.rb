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
    let(:book1) {Book.create(title: "Dogs", author: "Johnson, Ben")}
    let(:book2) {Book.create(title: "Cats", author: "Schroeder, Pete")}

    it 'searches for book with dogs in title' do
      expect(Book.search("title", "Dogs")).to eq [book1]
    end

    it 'searches for book with Johnson in author' do
      expect(Book.search("author", "Schroeder, Pete")).to eq [book2]
    end

    it 'finds no results for search that does not match' do
      expect(Book.search("title", "Dinosaurs")).to eq []
    end

    context "fuzzy search" do
      it 'finds a book with only dog in title' do
        expect(Book.search("title", "dog")).to eq [book1]
      end

      it 'finds a book with only pete in author' do
        expect(Book.search("author", "pete")).to eq [book2]
      end
    end
  end
end
