class Cukilog < ActiveRecord::Base
	attr_accessible :date, :statement, :addminus
	belongs_to :user
end
