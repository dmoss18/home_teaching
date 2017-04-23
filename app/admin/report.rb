ActiveAdmin.register Report do
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
    column :household_name
    column :status
    column :message
    column :assignment do |report|
      qm = report.assignment.quorum_member
      link_to([qm.first_name, qm.last_name].join(' '), admin_quorum_member_path(qm))
    end
    column :created_at
    column :updated_at
    actions
  end

end
