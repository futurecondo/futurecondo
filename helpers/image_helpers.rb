module ImageHelpers
  def photo(name)
    path1440 = image_path("#{name}-1440.jpg")
    path1000 = image_path("#{name}-1000.jpg")
    path640  = image_path("#{name}-640.jpg")
    path320  = image_path("#{name}-320.jpg")
    <<~IMAGE_TAG
      <img srcset="#{path1440} 1440w,
                   #{path1000} 1000w,
                   #{path640} 640w,
                   #{path320} 320w"
             sizes="(max-width: 640px) 320px,
                   (max-width: 1000px) 600px,
                   (max-width: 1440px) 1040px,
                   1440px"
              src="#{path1000}" class="img-fluid">
    IMAGE_TAG
  end
end
