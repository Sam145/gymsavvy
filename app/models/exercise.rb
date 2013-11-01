class Exercise < ActiveRecord::Base
   attr_accessible :name, :muscle_group, :description, :option_types, :assets_attributes

   before_validation :capitalize_name


   has_one :program
   has_many :assets

	accepts_nested_attributes_for :assets, allow_destroy: true

   validates :name, { presence: true, uniqueness: true }
   validates :muscle_group, { presence: true }
   validates :description, { presence: true }
   validates :option_types, { presence: true }





   scope :cardio, where("muscle_group = ?", "Cardio")
   scope :abs, where("muscle_group = ?", "Abs and Obliques")
   scope :arms, where("muscle_group = ?", "Biceps and Triceps")
   scope :shoulders, where("muscle_group = ?", "Shoulders")
   scope :legs, where("muscle_group = ?", "Legs")
   scope :chest, where("muscle_group = ?", "Chest")
   scope :back, where("muscle_group = ?", "Back")



   private

   def capitalize_name
      self.name.capitalize!
   end


   

end
