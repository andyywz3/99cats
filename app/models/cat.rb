class Cat < ActiveRecord::Base
  attr_accessible :age, :birthday, :color, :name, :sex, :user_id

  has_many :cat_rental_requests, :dependent => :destroy
  belongs_to :user

  validates :color, :inclusion  => {:in => ["red","green","blue"] }
  validates :name, :color, :sex, :presence => true

end
