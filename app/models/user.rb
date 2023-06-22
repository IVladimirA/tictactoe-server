# frozen_string_literal: true

class User < ApplicationRecord
  validates :guest, inclusion: { in: [true, false] }
  validates :username, presence: true, if: -> { guest == false }
  validates :email, presence: true, if: -> { guest == false }
  validates :password_hash, presence: true, if: -> { guest == false }

  def games
    Game.where('first_player_id = ? OR second_player_id = ?', id, id)
  end

  def win
    self.wins += 1
  end

  def lose
    self.loses += 1
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
