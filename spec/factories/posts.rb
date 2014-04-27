FactoryGirl.define do
  factory :post1, class: Post do
    title "post 1"
    body "In Progress"
    association :user, factory: :user1
  end

  factory :post2, class: Post do
    title "post 2"
    body "In Progress"
    association :user, factory: :user2
  end
end