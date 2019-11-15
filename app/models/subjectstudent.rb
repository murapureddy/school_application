class Subjectstudent < ApplicationRecord
  belongs_to :subject
  belongs_to :student

  def self.subject(id)
    subject = Subject.find id
    subject = subject.sub_name
  end
end
