class Program < ActiveRecord::Base
  attr_accessible :type, :reps, :sets, :rest_time, :weight, :distance, :time, :sequence, 
  					:distance_unit, :swim_distance_unit, :weight_unit, :hours, :minutes

  belongs_to :program_set
  belongs_to :exercise


end
