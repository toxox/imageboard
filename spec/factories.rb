FactoryGirl.define do
  factory :board do
    sequence(:name) { |n| "Board#{n}"}
    sequence(:short_name) { |n| "b#{n}"}
    number_of_discussions 5
  end

  factory :discussion do
    sequence(:name) { |n| "Poster#{n}"}
    sequence(:subject) { |n| "Subject#{n}"}
    sequence(:comment) { |n| "Comment#{n}"}
    board
  end

  factory :post do
    sequence(:name) { |n| "Poster#{n}"}
    sequence(:comment) { |n| "Comment#{n}"}
    discussion
  end
end