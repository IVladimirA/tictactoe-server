# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Jwt::RevokerService do
  subject(:call) { described_class.call(user: user) }

  let(:user) { create(:user, refresh: refresh) }
  let(:refresh) { 'token value' }

  it 'revokes refresh token' do
    expect { call }.to change(user, :refresh).from(refresh).to(nil)
  end

  context 'when user is a guest' do
    let(:user) { create(:guest_user, refresh: refresh) }

    it 'revokes refresh token' do
      expect { call }.to change(user, :refresh).from(refresh).to(nil)
    end
  end
end
