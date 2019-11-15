class Student < ApplicationRecord
  has_many :subjects, :through => :subjectstudent
  has_many :subjectstudent, dependent: :destroy
  validates :name, :presence => true
  attr_accessor :sub_id, :mark
  after_create :subject
  after_save :cal_total, :ranking

  def cal_total
     total = 0
     self.subjectstudent.each do |sub_mark|
      total = total + sub_mark.marks
     end
     self.update_column(:total,total)
  end

  def ranking
        rank, i = 1, 0
        student=Student.order(total: :desc)
        student = student.map{ |c| [c.id,c.total] }.to_h
        student_mark = []
        student.each_value{|v|     student_mark << v}
        student.map { |k,x|
          i += 1
          if x != student_mark[i-2]
            rank = i
          else
            rank
          end
          q=Student.find k
          q.update_column(:rank,rank)
        }
  end

  def subject
    h = {}
    sub_id.zip(mark) { |a,b| h[a.to_sym] = b }
    h.each do |k,v|
      Subjectstudent.create(student_id: self.id, subject_id: k, marks: v) if v.present?
    end
  end
end
