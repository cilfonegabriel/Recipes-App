FactoryBot.define do
  factory :user do
    id { 153 }
    email { 'hu@hu.hu' }
    password { 'qwerty' }
    name { 'test user' }
    # Add additional fields as required via your User model
  end

  factory :food do
    id { 1 }
    name { 'test food' }
    measurement_unit { 'test unit' }
    price { 1 }
    quantity { 1 }
    user
  end

  factory :recipe do
    name { 'test recipe' }
    preparation_time { '01:00' }
    cooking_time { '01:00' }
    description { 'test description' }
  end

  factory :recipe_food do
    quantity { 1 }
    food
    recipe
  end
end
