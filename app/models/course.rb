class Course < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :password, presence: true

  after_create do |course|
    course.code = create_course_code(course.id)
    course.save
  end

  private

  def create_course_code(id)
    (id + Settings.course_seed).to_s(36)
  end
end
