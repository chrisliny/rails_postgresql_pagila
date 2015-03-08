class Category < ActiveRecord::Base
  self.table_name = 'category'
  self.primary_key = 'category_id'
  has_and_belongs_to_many :films, join_table: 'film_category'
end
