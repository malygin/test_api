require 'test_helper'
class UrlLoadTest < ActionDispatch::IntegrationTest

  test 'load with normal url'    do
    get '/api/load_content?url=https://www.yandex.ru/'
    assert_equal 200, response.status
    assert_equal true,  StoredContent.where(source: 'https://www.yandex.ru/').where(tag: 'h1').size > 0
  end

  test 'load with invalid url'    do
    get '/api/load_content?url=htddtps://www.yandex.ru/'
    assert_equal 422, response.status
    assert_equal true,  StoredContent.where(source: 'https://www.yandex.ru/').size == 0

  end

  test 'load with non existing url'    do
    get '/api/load_content?url=https://www.yandexblabal.ru/'
    assert_equal 422, response.status
    assert_equal true,  StoredContent.where(source: 'https://www.yandex.ru/').size == 0

  end


end
