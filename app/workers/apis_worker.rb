# frozen_string_literal: true

# Processing API data
class ApisWorker
  include Sidekiq::Worker

  def perform(social_network)
    # calling facebook, twitter, instagram services
    @api_service = ApiService.new
    @api_service.send(social_network)
  end
end
