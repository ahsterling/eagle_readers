class Book < ActiveRecord::Base
  validates :title, presence: true

  def better_title
    new_title = /\s\/\s?\z/.match(self.title).pre_match
    self.title = new_title
    self.save
  end

  def self.search(search)
    if search
      @books = Book.where('title ILIKE ?', search)
    else
      @books = Book.all
    end
  end
end
