module FilterCommentHelper
  def filter_comment(comment)

    str1 = '<span class = "quote">' #open greentext
    str2 = '</span>' #close greentext

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
end