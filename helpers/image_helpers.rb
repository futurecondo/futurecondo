module ImageHelpers
  def gallery(names)
    gallery_html = ''

    previous_name = nil
    next_name = nil
    while(names.any?) do
      name = next_name || names.shift
      next_name = names.shift
      gallery_html += photo(name, previous_name: previous_name, next_name: next_name)
      previous_name = name
    end

    gallery_html + photo(next_name, previous_name: previous_name)
  end

  def photo(name, previous_name: nil, next_name: nil)
    path1440 = image_path("#{name}-1440.jpg")
    path1000 = image_path("#{name}-1000.jpg")
    path640  = image_path("#{name}-640.jpg")
    path320  = image_path("#{name}-320.jpg")

    previous_link = previous_name ? "<a class=\"cssbox_prev\" href=\"##{previous_name}\">&lt;</a>" : ''
    next_link = next_name ? "<a class=\"cssbox_next\" href=\"##{next_name}\">&gt;</a>" : ''

    <<~IMAGE_TAG
      <div class="cssbox">
        <a id="#{name}" href="##{name}">
          <img class="cssbox_thumb" src="#{path320}" />
          <span class="cssbox_full">
            <img srcset="#{path1440} 1440w,
                         #{path1000} 1000w,
                         #{path640} 640w,
                         #{path320} 320w"
                   sizes="(max-width: 640px) 320px,
                         (max-width: 1000px) 600px,
                         (max-width: 1440px) 1040px,
                         1440px"
                    src="#{path1000}" class="img-fluid">
          </span>
        </a>
        <a class="cssbox_close" href="#void"></a>
        #{previous_link}
        #{next_link}
      </div>
    IMAGE_TAG
  end
end
