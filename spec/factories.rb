FactoryGirl.define do
  factory :board do
    name       "First Board"
    short_name "fb"
  end

  factory :discussion do
    name     "Firsty McLastname"
    subject  "thread subject"
    comment  "thread comment"
    board_id 1
  end

  factory :post do
    name          "Secondy McLastname"
    comment       "post comment"
    discussion_id 1
  end
end