FactoryBot.define do
  factory :diary do
    title {"Test"}
    expiration {DateTime.now + 10.minutes}
    kind {rand(0..1)}
  end
end