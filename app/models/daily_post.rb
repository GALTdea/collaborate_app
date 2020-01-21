class DailyPost < ApplicationRecord
  belongs_to :user
  
  has_many :entries

  accepts_nested_attributes_for :entries


  # has_one :challenge
end
