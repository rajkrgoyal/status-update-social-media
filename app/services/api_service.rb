# frozen_string_literal: true

# Created 3 different methods to make service call asynchronous.
class ApiService
  def initialize
    @tweets = []
    @statuses = []
    @photos = []
  end

  # return false, if response is not valid
  def api_response(social_network)
    url = Rails.application.credentials.API_URL + '/' + social_network
    @result = HTTParty.get(url).parsed_response
    @result.is_a?(Array)
  end

  def facebook
    # return if response is not array and cache would not be updated as data is not valid
    return unless api_response('facebook')

    begin
      @result.each do |h|
        @statuses << { name: h['name'], status: h['status'] } if h['name'].present? && h['status'].present?
      end
      # overwrite cache, if API return valid data
      Rails.cache.write 'facebook', @statuses if @statuses.present?
    rescue StandardError
      # will return @statuses from cache without update
    end
  end

  def twitter
    # return if response is not array and cache would not be updated as data is not valid
    return unless api_response('twitter')

    begin
      @result.each do |h|
        @tweets << { username: h['username'], tweet: h['tweet'] } if h['username'].present? && h['tweet'].present?
      end
      # overwrite cache, if API return valid data
      Rails.cache.write 'twitter', @tweets if @tweets.present?
    rescue StandardError
      # will return @tweets from cache without update
    end
  end

  def instagram
    # return if response is not array and cache would not be updated as data is not valid
    return unless api_response('instagram')

    begin
      @result.each do |h|
        @photos << { username: h['username'], picture: h['picture'] } if h['username'].present? && h['picture'].present?
      end
      # overwrite cache, if API return valid data
      Rails.cache.write 'instagram', @photos if @photos.present?
    rescue StandardError
      # will return @photos from cache without update
    end
  end
end
