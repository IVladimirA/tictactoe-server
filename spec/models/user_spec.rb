# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it 'is a normal user' do
    expect(build(:user)).to be_valid
  end

  it 'is a guest user' do
    expect(build(:guest_user)).to be_valid
  end

  it 'has no username' do
    expect(build(:user, username: nil)).to be_invalid
  end

  it 'has no email' do
    expect(build(:user, email: nil)).to be_invalid
  end

  it 'has no passHash' do
    expect(build(:user, passHash: nil)).to be_invalid
  end
end
