# Loads the data used by the site from the companion wordpress site

require 'open-uri'
require 'awrence'

class HomeController < ApplicationController
  def index
    @wordpress_resources = {
      pages: wordpress_list(:page),
      events: wordpress_list(:event)
    }.to_camelback_keys
  end

  private

  def wordpress_list(type)
    begin
      JSON.load open wordpress_resource_url type
    rescue => e
      puts "Something went wrong", e
    end
  end

  def wordpress_resource_url(type)
    raise 'Invalid type' unless [:page, :event].include? type

    "http://localhost/citylife-wordpress/?" +
      "json=get_posts&" +
      "count=1000&" +
      "post_type=#{type}"
  end
end
