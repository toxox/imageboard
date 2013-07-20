module ImagesHelper
  def thumb_with_link(model)
    link_to image_tag(model.image_url(:thumb)),
                           model.image_url if model.image?
  end
end