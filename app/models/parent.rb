class Parent < ActiveRecord::Base
  has_many :kids
  has_many :playdates, through: :kids
end