# frozen_string_literal: true

module Games
    class Helper
      def self.correctCoords(row:, column:)
        0 <= row && row < 15 && 0 <= column && column < 15
      end
    end
  end
  