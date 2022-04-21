class ShieldsService
  ROOT_ENDPOINT = "https://img.shields.io/static/v1?"

  attr_reader :http_client

  def initialize(parametrs, http_client: nil)
    @http_client = setup_http_client
    @parametrs = parametrs
  end

  def call
    self.generate_badge(self.badge_params)
  end

  def badge_params
    { label: @parametrs[:label],
      message: @parametrs[:message],
      color: @parametrs[:color],
      logoColor: "gold",
      logo: "streamlit" }
  end

  def generate_badge(params)
    @http_client.post do |request|
      request.params = params
    end
  end
  

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
