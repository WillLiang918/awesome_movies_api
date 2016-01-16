class Movie < ActiveRecord::Base
  validates :title, :year, :synopsis, presence: true
end
