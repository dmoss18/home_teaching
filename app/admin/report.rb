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

  scope :this_month, default: true
  scope :previous_month
  scope :all

  filter :period
  filter :status, as: :select, collection: proc { Report::Status.values }
  filter :household_name

  index do
    id_column
    column :household_name
    column :status
    column :message
    column :assignment do |report|
      qm = report.assignment.quorum_member
      link_to([qm.first_name, qm.last_name].join(' '), admin_quorum_member_path(qm))
    end
    column :period do |report|
      report.period.strftime('%B %Y')
    end
    actions
  end

end
