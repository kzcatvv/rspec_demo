class Product < ActiveRecord::Base
	validates_presence_of :name, :message => '不能为空'
	validates_numericality_of :price, greater_than: 0

	def info
		[name, price].join(" $")
	end

	def self.by_letter(letter)
		where("name like ?", "#{letter}%").order(price: :asc)
	end
end
