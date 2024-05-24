# Common utils
module Utils
  protected

  def read_file(file_path)
    file = File.open(file_path, 'r')
    data = file.read
    file.close

    data
  end
end
