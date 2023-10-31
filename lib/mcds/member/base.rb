module Mcds
  module Member
    class Base
      def initialize(endpoint)
        @endpoint = endpoint
      end

      attr_reader :endpoint

      def resource(params: {}, uuid: nil)
        Mcds::Api::Resource.new(endpoint, params, uuid)
      end
    end
  end
end
