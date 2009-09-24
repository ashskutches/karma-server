# = Adjustment
#
# The adjustment model is used to store changes to karma. Each adjustment
# has a single positive or negative value, which is applied to a given user's
# bucket.
#
# == Schema Information
#
# Table name: adjustments
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  bucket_id  :integer         not null
#  value      :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

class Adjustment < ActiveRecord::Base
  validates_presence_of :user_id, :bucket_id, :value
  validates_numericality_of :value
  default_scope :order => :created_at
  
  belongs_to :user
  belongs_to :bucket
  
  attr_accessible :value
end
