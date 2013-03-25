class Course < ActiveRecord::Base
  belongs_to :org
  belongs_to :location
  has_many :course_tags
  has_many :course_sessions
  has_many :tags, :through => :course_tags
  attr_accessible :name, :price, :city, :province, :category, :location_id, :sessions, :participants
  validates :name, :presence => true

  def self.search(search)
  	if search
  		str = "%#{search.downcase}%"
      where('LOWER (name) LIKE ? OR LOWER (city) LIKE ? OR LOWER (province) LIKE ?', str, str, str)
    else 
  		scoped
  	end
  end
end

