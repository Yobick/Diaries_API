class Diary < ApplicationRecord
  enum kind: { public_type: 0, private_type: 1 }
  has_many :notes
end
