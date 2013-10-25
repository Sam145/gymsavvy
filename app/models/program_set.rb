class ProgramSet < ActiveRecord::Base
   attr_accessible :name, :description, :programs_attributes

   belongs_to :user
   has_many :programs, order: :sequence

   accepts_nested_attributes_for :programs, :allow_destroy => true


end
