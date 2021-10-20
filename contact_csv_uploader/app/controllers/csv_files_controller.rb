class CsvFilesController < ApplicationController
  def index
    @csv_files = Kaminari.paginate_array(Contact.includes(:csv_file)
                                                .where(user_id: 1)
                                                .map(&:csv_file)
                                                .uniq)
                         .page params[:page]
  end

  def show
    @csv_file = CsvFile.find(params[:id])
  end
end
