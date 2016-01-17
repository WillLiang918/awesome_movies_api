class Movie < ActiveRecord::Base
  has_attached_file :poster,
  default_url: "default.jpg",
  :styles => {
    :small => "220x320#",
    :normal => "420x630#"}
  validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/
  validates :title, :year, :synopsis, presence: true
  has_many :castings
  has_many :actors, through: :castings
end
