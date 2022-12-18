ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :phone_number, :password, :password_confirmation

  filter :email

  form do |form|
    form.inputs do
      form.input :first_name
      form.input :last_name
      form.input :email
      form.input :phone_number
      if form.object.new_record?
        form.input :password, required: true
        form.input :password_confirmation, required: true
      end
    end
    form.actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :phone_number
    end
  end

  index do
    selectable_column
    column :first_name
    column :last_name
    column :email
    column :phone_number
    actions
  end
end