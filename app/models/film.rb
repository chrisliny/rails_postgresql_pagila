class Film < ActiveRecord::Base
  self.table_name = "film"
  self.primary_key = "film_id"
  has_and_belongs_to_many :actors, join_table: "film_actor"
  has_and_belongs_to_many :categories, join_table: "film_category"
  belongs_to :language
  has_many :inventories
  
  def self.search(search)
    if search
      where('title LIKE? ', "%#{search}%")
    else
      where(nil)
    end
  end
end
