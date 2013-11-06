class ProgramSet < ActiveRecord::Base
   attr_accessible :name, :description, :programs_attributes

   belongs_to :user
   has_many :programs, :dependent => :delete_all, order: :sequence

   accepts_nested_attributes_for :programs, :allow_destroy => true

end
