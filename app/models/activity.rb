class Activity < ActiveRecord::Base
  attr_accessible :code, :name

  validates :name, :presence => true
  validates :code, :presence => true
  validates :code, :uniqueness => true
  validates :code, :format => {
    :message => 'Only A-Z a-z 0-9 . /  allowed',
    :with => /\A[A-Za-z0-9.\/]+\z/,
  }
end
