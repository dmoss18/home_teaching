ActiveAdmin.register_page 'Import' do
  content do
    render partial: 'import'
  end

  page_action :assignments, method: :post do
    flash[:notice] = 'Successfully imported assignments'

    ImportService.import_assignments(params[:assignments][:file], current_user)

    redirect_to admin_import_path
  end

  page_action :households, method: :post do
    flash[:notice] = 'Successfully imported households'

    ImportService.import_households(params[:households][:file], current_user)

    redirect_to admin_import_path
  end
end
