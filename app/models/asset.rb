class Asset < ActiveRecord::Base
  attr_accessible :exercise_id, :image

  belongs_to :exercise

  has_attached_file :image, 

  styles: {
  	thumb: '110x110#',
  	medium: '190x190#',
  	large: '300x300#'
  }

end
