ActiveAdmin.register Assignment do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    id_column
    column :quorum_member do |assignment|
      qm = assignment.quorum_member
      link_to([qm.first_name, qm.last_name].join(' '), admin_quorum_member_path(qm))
    end
    column :household
    column :assignment_type
    column :created_at
    column :updated_at
    actions
  end

end
