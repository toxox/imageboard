module EmptyNameHelper
  def set_name_to_anon_if_empty
    self.name = "Anon" if self.name.empty?
  end
end