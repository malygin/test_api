module API
  class StoredContentController < ApplicationController

    def load_content
      if params[:url] and  url_valid?(params[:url]) and CrawlerService.new().crawl_list(params[:url])
        render :nothing => true, status: 200
      else
        # invalid url
        render :nothing => true, status: 422
      end
    end

    def list_content
        render json: StoredContent.all.map {|s|
             s.tag == 'a' ? s.html_attrs['href'] :  s.content
        }, status: 200
    end

    private

    def url_valid?(url)
      !!url.match(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-=\?]*)*\/?$/)
    end

  end


end