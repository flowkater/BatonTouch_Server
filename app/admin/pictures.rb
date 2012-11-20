ActiveAdmin.register Picture do
  # index do
  # 	column :image
  # 	column :imageable_id
  # 	column :imageable_type
  # end

  form do |f|
  	f.inputs "Picture" do
  		f.input :image
  		f.input :imageable_id
  		f.input :imageable_type
  	end
  	f.buttons
  end
end
