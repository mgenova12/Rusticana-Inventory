class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  scope :search_product, ->(term) { find_by("lower(name) LIKE ?", "term.downcase") }
  

end
