class Inventory < ActiveRecord::Base
  self.table_name = "inventory"
  self.primary_key = "inventory_id"
  has_many :rentals
  belongs_to :film
end
