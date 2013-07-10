class Cat < ActiveRecord::Base
  attr_accessible :age, :birthday, :color, :name, :sex

  has_many :cat_rental_requests, :dependent => :destroy

  validates :color, :inclusion  => {:in => ["red","green","blue"] }
  validates :name, :color, :sex, :presence => true

end
