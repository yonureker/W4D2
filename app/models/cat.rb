# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'date'

class Cat < ApplicationRecord
  COLORS = ["yellow", "red", "blue", "pink", "purple", "rainbow", "nyan", "black"].freeze
  SEX = ['M', 'F']

  def self.get_colors
    return COLORS
  end

  def age
    current_age = Date.today.year - birth_date.year
    return current_age
  end

  validates :sex, inclusion: { in: SEX}
  validates :color, inclusion: {in: COLORS}
  validates :color, :name, :sex, presence: true
end
