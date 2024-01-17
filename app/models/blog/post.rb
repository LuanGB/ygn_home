class Blog::Post < ApplicationRecord
  def html_safe_content
    content.html_safe
  end
end
