class Review < ActiveRecord::Base
	belongs_to :book

	validates :description, :presence => true
end	