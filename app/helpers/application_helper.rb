module ApplicationHelper

  def donut_image_tag(donut, options = {})
    if donut.data.present?
      path = donut_path(donut, format: donut.extension)
      link_to(image_tag(path, { alt: donut.title }.merge(options)), donut)
    else
      image_tag("NoImage.png", { alt: donut.title }.merge(options))
    end
  end
end
