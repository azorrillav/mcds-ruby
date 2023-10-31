module Mcds
  module Member
    class Journey < Base
      class << self
        def fetch_journey_by_id(user_uuid:, journey_id:, params: {})
          new("v1/member/#{user_uuid}/journey/msk/#{journey_id}")
            .resource(params: params, uuid: user_uuid)
            .get
        end

        def fetch_current_journey(user_uuid:, params: {})
          new("v1/member/#{user_uuid}/journey/msk/")
            .resource(params: params, uuid: user_uuid)
            .get
        end

        def update_journey(user_uuid:, params: {})
          new("v1/member/#{user_uuid}/journey/msk/")
            .resource(params: params, uuid: user_uuid)
            .put
        end
      end
    end
  end
end
