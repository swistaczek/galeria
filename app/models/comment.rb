class Comment < ActiveRecord::Base
	belongs_to :photo
	validates :author, :presence => true
	validates :body, :presence => true
end
