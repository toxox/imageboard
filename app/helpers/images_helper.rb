module ImagesHelper
  def thumb_with_link(model)
    if model.image?
    link_to image_tag(model.image_url(:thumb)),
                           model.image_url, target: "_blank"
    end
  end
end