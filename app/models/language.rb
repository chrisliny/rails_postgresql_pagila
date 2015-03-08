class Language < ActiveRecord::Base
  self.table_name = 'language'
  self.primary_key = 'language_id'
  has_many :films
end
