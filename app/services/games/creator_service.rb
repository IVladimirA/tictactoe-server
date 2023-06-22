# frozen_string_literal: true

module Games
  class CreatorService
    def self.call(params)
      params[:state] = Array.new(15, Array.new(15, 0))
      params[:turn] = 'first'
      params[:over] = false
      Game.create(params)
    end
  end
end
