require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do (page_title = '')
    if page_title.empty?
      assert_equal full_title,         "Ruby on Rails Tutorial SampleApp"
    else
      assert_equal full_title("#{page_title}"), "#{page_title} | Ruby on Rails Tutorial SampleApp"
    end
  end
end