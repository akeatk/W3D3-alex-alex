class Course < ApplicationRecord
  validates :name, :prereq_id, :instructor_id, presence: true, uniqueness: true
  
  has_one :prerequisite,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course
    
  has_one :instructor,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User
  
  has_many :enrollments,
    primary_key: :id, 
    foreign_key: :course_id,
    class_name: :Enrollment
    
  has_many :enrolled_students, 
    through: :enrollments,
    source: :student
    
end
