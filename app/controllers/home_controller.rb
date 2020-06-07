# frozen_string_literal: true

# Actions related to social media updates, it calls worker and worker call services
class HomeController < ApplicationController
  after_action :api_worker, only: [:index]

  def index
    data = Social::NETWORK.map { |social| Rails.cache.read social }

    render plain: { twitter: data[0], facebook: data[1], instagram: data[2] }
  end

  private

  def api_worker
    # Calling perform_async class method
    Social::NETWORK.each { |social| ApisWorker.perform_async(social) }
  end
end
