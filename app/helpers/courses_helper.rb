# encoding: utf-8
module CoursesHelper
  def sharing_display(sharing)
    if sharing
      "共有"
    else
      "専有"
    end
  end
end
