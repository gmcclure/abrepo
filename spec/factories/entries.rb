# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    citation "MyText"
    annotation "MyText"
    bibliography nil
  end
end
