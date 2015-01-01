ThinkingSphinx::Index.define(:vehicle, :with => :active_record) do  
  indexes :body_style
  indexes :reg_year    
  indexes :manufactured_year
  indexes :milage
  indexes :exterior_color
  indexes :location, :sortable => true  
end