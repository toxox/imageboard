FactoryGirl.define do
  factory :discussion do
    name "Firsty McLastname"
    subject "thread subject"
    comment "thread comment"
  end

  factory :post do
    name "Secondy McLastname"
    comment "post comment"
    discussion_id 1
  end
end