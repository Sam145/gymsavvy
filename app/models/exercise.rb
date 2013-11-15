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





   scope :cardio, where("muscle_group = ?", "Cardio").order("name")
   scope :abs, where("muscle_group = ?", "Abs and Obliques").order("name")
   scope :arms, where("muscle_group = ?", "Biceps and Triceps").order("name")
   scope :shoulders, where("muscle_group = ?", "Shoulders").order("name")
   scope :legs, where("muscle_group = ?", "Legs").order("name")
   scope :chest, where("muscle_group = ?", "Chest").order("name")
   scope :back, where("muscle_group = ?", "Back").order("name")



   private

   def capitalize_name
      self.name.capitalize!
   end


   

end
