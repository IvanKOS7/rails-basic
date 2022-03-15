class GitHubClient

	ROOT_ENDPOINT = "https://api.github.com"
	ACCESS_TOKEN = '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'

	def initialize
		@http_client = setup_http_client
	end

	def create_gist(params)
		@http_client.post('gists') do |request|
       request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
			request.headers['Content-Type'] = 'application/json'
			request.body = params.to_json
		await @http_client.request('POST /gists', params)

	end

	def setup_http_client
		Faraday.new(url: ROOT_ENDPOINT)
	end

end
