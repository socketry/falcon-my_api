# frozen_string_literal: true

load :rack

hostname = ENV.fetch("HOSTNAME", File.basename(__dir__))
port = ENV.fetch("PORT", 3000)
http_endpoint = "http://0.0.0.0:#{port}"
workers_count = ENV.fetch("FALCON_COUNT", 1).to_i

rack(hostname) do
	cache false
	count workers_count

	endpoint Async::HTTP::Endpoint.parse(http_endpoint)
end
