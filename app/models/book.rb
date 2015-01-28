class Book < ActiveRecord::Base
  validates :title, presence: true

  def better_title
    new_title = / \/ \z/.match(self.title).pre_match
    self.title = new_title
    self.save
  end
end
