FactoryGirl.define do
  factory :shortener do
    long_url 'www.google.com'
    short_url ''
    token ''
  end
end
