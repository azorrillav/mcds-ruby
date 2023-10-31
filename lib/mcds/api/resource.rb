require 'faraday'
require 'json'

module Mcds
  module Api
    class Resource
      def initialize(endpoint, params = {}, uuid = nil)
        @endpoint = endpoint
        @params = params
        @uuid = uuid
        @url = Mcds.url
        @username = Mcds.user_name_or_api_key
        @password = Mcds.password_or_x
      end

      attr_reader :endpoint, :params

      def api_url
        URI.join(@url, @endpoint).to_s
      end

      def json_payload
        @params.to_json
      end

      def post
        Faraday.post(api_url, json_payload, headers).then do |response|
          return JSON.parse(response.body)

        rescue StandardError
          raise Faraday::BadRequestError, api_error_message(response)
        end
      end

      def get
        Faraday.get(api_url, params, headers).then do |response|
          return {
            data: JSON.parse(response.body),
            status: response.status,
            status_message: response.reason_phrase
          }

        rescue StandardError
          raise Faraday::BadRequestError, api_error_message(response)
        end
      end

      def put
        Faraday.put(api_url, json_payload, headers).then do |response|
          return {
            data: JSON.parse(response.body),
            status: response.status,
            status_message: response.reason_phrase
          }

        rescue StandardError
          raise Faraday::BadRequestError, api_error_message(response)
        end
      end

      def delete
        Faraday.delete(api_url, headers).then do |response|
          return {
            data: JSON.parse(response.body),
            status: response.status,
            status_message: response.reason_phrase
          }

        rescue StandardError
          raise Faraday::BadRequestError, api_error_message(response)
        end
      end

      def api_error_message(response)
        'API Error: Your request is not successful.' \
          "X-Request-Id : #{response.headers[:x_request_id]}" \
          "Response Code: #{response.status} Response Body: #{response.body}"
      end

      def headers
        {
          'Content-Type': 'application/json',
          Authorization: "Basic #{auth_header}"
        }
      end

      def auth_header
        Base64.strict_encode64("#{@username}:#{@password}")
      end
    end
  end
end
