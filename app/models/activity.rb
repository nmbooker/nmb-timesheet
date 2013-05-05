class Activity < ActiveRecord::Base
  
  # code: A human friendly unique identifier.  Anticipating CLI tools.
  #       Recommendation: use dots (.) for defining hierarchy.
  # name: The name of the activity type.


  attr_accessible :code, :name

  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :code, :presence => true
  validates :code, :uniqueness => true
  validates :code, :format => {
    :message => 'Only A-Z a-z 0-9 . /  allowed',
    :with => /\A[A-Za-z0-9.\/]+\z/,
  }

  default_scope order('name, code, id')
end
