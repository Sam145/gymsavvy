class Exercise < ActiveRecord::Base
   attr_accessible :name, :muscle_group, :description, :option_types

   has_one :program

   scope :cardio, where("muscle_group = ?", "Cardio")
   scope :abs, where("muscle_group = ?", "Abs and Obliques")
   scope :arms, where("muscle_group = ?", "Biceps and Triceps")
   scope :shoulders, where("muscle_group = ?", "Shoulders")
   scope :legs, where("muscle_group = ?", "Legs")
   scope :chest, where("muscle_group = ?", "Chest")
   scope :back, where("muscle_group = ?", "Back")




   

end
