class KidsPlaydate < ActiveRecord::Base
  belongs_to :kid 
  belongs_to :playdate
end