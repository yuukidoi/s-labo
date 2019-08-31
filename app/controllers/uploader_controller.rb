class UploaderController < ApplicationController
  def index
  end

  def form
  end

  def upload
    @upload_file = UploadFile.new( params.require(:upload_file).permit(:name, :file).permit(:name, :file))
    @upload_file.save
    render new_document_path
  end

  def download
    @upload_file = UploadFile.find(params[:id].to_i)
    filepath = @upload_file.file.current_path
    stat = File::stat(filepath)
    send_file(filepath, :filename => @upload_file.file.url.gsub(/.*\//,''), :length => stat.size)
    
  end
end
