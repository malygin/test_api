require 'test_helper'
class UrlListTest < ActionDispatch::IntegrationTest
  setup do
    stored_contents(:one)
    stored_contents(:two)
  end

  test 'list content'    do
    get '/api/list_content'
    assert_equal 200, response.status
    assert_includes response.body, 'h1Content'
    assert_includes response.body, 'ahref'
  end



end
