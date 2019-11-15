class Subject < ApplicationRecord
  belongs_to :teacher, :optional => true
  has_many :students, :through => :subjectstudent
  has_many :subjectstudent, dependent: :destroy

end
