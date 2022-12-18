ActiveAdmin.register Property do
  permit_params :name, :description, :address, :rent_amount, :owner_address, :owner_name, :owner_phone_number,
                :rent_payment_days, images: []

  form html: { multipart: true } do |form|
    form.inputs do
      form.input :name
      form.input :description
      form.input :address
      form.input :rent_amount
      form.input :owner_name
      form.input :owner_address
      form.input :owner_phone_number
      form.input :images, as: :file, input_html: { multiple: true }
      form.input :rent_payment_days
    end
    form.actions
  end


  show do
    attributes_table do
      row :name
      row :description
      row :address
      row :rent_amount
      row :owner_name
      row :owner_address
      row :owner_phone_number
      row :rent_payment_days
      row :images do
        div do
          property.images.each do |img|
            div do
              image_tag url_for(img), size: "200x200"
            end
          end
        end
      end
    end
  end

  index do
    selectable_column
    column :name
    column :description
    column :address
    column :rent_amount
    column :owner_name
    column :owner_address
    column :owner_phone_number
    column :rent_payment_days
    actions
  end

end