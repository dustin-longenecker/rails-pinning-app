FactoryBot.define do
  factory :user do 
    sequence(:email) { |n| "coder#{n}@skillcrush.com" }
    first_name {"Skillcrush"}
    last_name {"Coder"}
    password {"secret"}
  end
  factory :pin do
  	sequence(:title) { |n| "title#{n}"}
  	url {"www.example.com"}
  	text {"some text"}
  	slug {"test-slug"}
  	category {FactoryBot.create(:category)}
  	
  end
  factory :category do
  	   name {"rails"}
  	end
  
end 