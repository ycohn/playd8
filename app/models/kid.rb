class Kid < ActiveRecord::Base
  belongs_to :parent
  has_many :playdates, through: :kids_playdates
  has_many :kids_playdates
end