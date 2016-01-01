class Playdate < ActiveRecord::Base
  has_many :kids_playdates
  has_many :kids, through: :kids_playdates
  has_many :parents, through: :kids 
end