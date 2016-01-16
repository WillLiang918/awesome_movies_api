class Movie < ActiveRecord::Base
  validates :title, :year, :synopsis, presence: true
  has_many :castings
  has_many :actors, through: :castings
end
