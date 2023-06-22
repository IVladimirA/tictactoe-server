# frozen_string_literal: true

module Users
  class CreatorService
    def self.call(user_params:)
      if user_params.dig(:guest) == true
        user = User.new(username: 'Guest', guest: true, email: '')
        user.password = ''
      else
        user = User.new(user_params)
        user.password = user_params[:password]
      end
      user.save!
      
      user
    end
  end
end
