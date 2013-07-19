module MakeLinksHelper
  def make_links(string)
    string.gsub(/((http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?)/, '<a href=\'\1\'>\1</a>')
  end
end