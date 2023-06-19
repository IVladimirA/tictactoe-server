# frozen_string_literal: true

module Users
  class CreatorService
    def self.call(user_params:)
      user = User.new(user_params)
      user.password = user_params[:password]
      user.save!

      user
    end
  end
end
