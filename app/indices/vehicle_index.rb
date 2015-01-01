ThinkingSphinx::Index.define(:vehicle, :with => :active_record) do  
  indexes :body_style
  indexes :reg_year    
  indexes :manufactured_year
  indexes :milage
  indexes :exterior_color
  indexes :location, :sortable => true  
  indexes manufacturer(:name), :as => :manufacturer
  indexes car_model(:name), :as => :car_model
  indexes varient(:name), :as => :varient
  has :varient_id, :manufacturer_id, :car_model_id, :created_at, :updated_at
end