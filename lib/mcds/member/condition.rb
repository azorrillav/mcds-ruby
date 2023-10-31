module Mcds
  module Member
    class Condition < Base
      class << self
        def fetch_conditions(member_uuid:, params: {})
          new("v1/member/#{member_uuid}/conditions/")
            .resource(params: params)
            .get
        end

        def fetch_msk_condition(member_uuid:, params: {})
          new("v1/member/#{member_uuid}/condition/msk/")
            .resource(params: params)
            .get
        end

        def create_msk_condition(member_uuid:, params: {})
          new("v1/member/#{member_uuid}/condition/msk/")
            .resource(params: params)
            .post
        end
      end
    end
  end
end
