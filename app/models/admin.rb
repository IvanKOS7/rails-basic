class Admin < User

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :created_tests, class_name: "Test"
end
