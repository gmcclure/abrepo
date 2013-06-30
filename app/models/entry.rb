class Entry < ActiveRecord::Base
  belongs_to :bibliography

  validates :citation, presence: true
end
