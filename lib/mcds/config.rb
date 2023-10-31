module Mcds
  class << self
    attr_accessor :url, :user_name_or_api_key, :password_or_x

    def url
      get_key :url
    end

    def user_name_or_api_key
      get_key :user_name_or_api_key
    end

    def password_or_x
      get_key :password_or_x
    end

    def get_key(key)
      instance_variable_get("@#{key}") || raise("Set Mcds.#{key} to use this feature")
    end
  end
end
