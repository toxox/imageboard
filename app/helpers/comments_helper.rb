module CommentsHelper
  def make_links(comment)
    comment.gsub(/((http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?)/, '<a href=\'\1\'>\1</a>')

    post_links = comment.scan(/>>\d+/)
    post_links.each do |post_link|
      comment.sub!(/#{post_link}/,
                   link_to(">>#{post_link.sub!(/>>/, "")}", anchor: post_link))
    end
    comment
  end

  #>greentext
  def filter_comment(comment)
    str1 = '<span class="quote">'
    str2 = '</span>'

    if comment != nil
      arr_lines = comment.split(/\n/)
      arr_lines.each do |a|
        if a[0] == ">"
          a.insert(0, str1)
          a << str2
        end
      end
    end
    comment = arr_lines.join('')
  end

  def show(comment)
    simple_format(make_links(filter_comment(comment)))
  end
end