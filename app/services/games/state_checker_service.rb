# frozen_string_literal: true

module Games
    class StateCheckerService
      def self.call(game:)
        for row in 0 ... 15
            for column in 0 ... 15
                winner =
                    check_segment(state: game.state, cells: row_generator(row: row, column: column)) ||
                    check_segment(state: game.state, cells: column_generator(row: row, column: column)) ||
                    check_segment(state: game.state, cells: first_diagonal(row: row, column: column)) ||
                    check_segment(state: game.state, cells: second_diagonal(row: row, column: column))
                return winner if winner.present? && winner != '0'
            end
        end

        nil
      end

      private

      def self.row_generator(row:, column:)
        Array.new(5) { |i| [row, column + i] }
      end

      def self.column_generator(row:, column:)
        Array.new(5) { |i| [row + i, column] }
      end

      def self.first_diagonal(row:, column:)
        Array.new(5) { |i| [row + i, column + i] }
      end

      def self.second_diagonal(row:, column:)
        Array.new(5) { |i| [row + i, column - i] }
      end

      def self.check_segment(state:, cells:)
        return nil if !Helper.correctCoords(row: cells.last[0], column: cells.last[1])
        for index in 0 ... cells.count - 1
          row1, column1 = cells[index]
          row2, column2 = cells[index + 1]
          if !Helper.correctCoords(row: row1, column: column1) || state[row1][column1] != state[row2][column2]
            return nil
          end
        end
        state[cells[0][0]][cells[0][1]]
      end
    end
  end
  