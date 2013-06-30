class Bibliography < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

  has_many :entries
end
