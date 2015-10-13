FactoryGirl.define do
  dates = ["2015-10-08", "2015-09-30", "2015-10-01"]
  price = [2500, 1900, 2300, 1000, 750]
  purchased = [0,1,2,3,4,5,6,7]

  factory :book do
    sequence :title do |n| 
      "Test Book #{n}" 
    end
    sequence :published_date do |n|
      Faker::Date.backward(n)
    end
    author "Jessa Pearce"
    price { Money.new(price.sample) }
  end
end
