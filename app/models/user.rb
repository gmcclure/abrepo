class User < ActiveRecord::Base
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_many :courses_taught, -> { where("enrollments.instructor = ?", true) }, through: :enrollments, source: :course

  def self.from_omniauth(auth)
    where(auth.slice('provider', 'uid')).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.nickname = auth['info']['email']
    end
  end
end
