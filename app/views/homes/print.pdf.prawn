pdf.text "Car Details ##{@car.id}", :size => 30, :style => :bold

pdf.move_down(30)

pdf.text "Car Info: #{@car.try(:carinfo)}" , :style => :bold

pdf.text "Color: #{@car.try(:exterior_color)}", :style => :bold

pdf.text "Location: #{@car.try(:location)}", :style => :bold

pdf.text "KMs Done: #{@car.try(:milage)}", :style => :bold

pdf.text "Fuel Type: #{@car.try(:fuel_type)}", :style => :bold

pdf.text "Body Style: #{@car.try(:body_style)}", :style => :bold

pdf.text "Price: #{@car.try(:sell_price)}", :style => :bold

pdf.image "#{@car.image.present? ? "#{Rails.root}/public#{@car.image.url(:original).split("?").first}" : "#{Rails.root}/public/missing.jpg"}", width: 150, height: 100