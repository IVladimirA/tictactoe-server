# frozen_string_literal: true

module Jwt
  class Helper
    def self.secret
      ENV.fetch('JWT_SECRET_KEY', nil)
    end

    def self.access_expire_after
      5.minutes
    end

    def self.refresh_expire_after
      90.days
    end
  end
end
