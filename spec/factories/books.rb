FactoryGirl.define do
  factory :book do
    title "Martin the Warrior / "
    author "Jacques, Brian."
    description "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    pub_date Date.today
    pages 145
    isbn "9783522172547"
    subject_array ["Mice", "Fiction."]
    genre_id 1
  end
end
