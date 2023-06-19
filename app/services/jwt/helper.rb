# frozen_string_literal: true

module Jwt
  class Helper
    def self.secret
      ENV.fetch('JWT_SECRET_KEY', nil)
    end

    def self.access_expire_after
      15.minutes
    end

    def self.refresh_expire_after
      7.days
    end
  end
end
