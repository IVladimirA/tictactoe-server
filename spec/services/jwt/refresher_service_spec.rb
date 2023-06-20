# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Jwt::RefresherService do
  subject(:call) { described_class.call(user: user) }

  let(:user) { create(:user, refresh: refresh) }
  let(:refresh) { 'old refresh value' }
  let(:new_refresh) { 'new refresh value' }
  let(:new_access) { 'new access value' }

  before do
    allow(Jwt::IssuerService).to receive(:call).with(user: user).and_return([new_access, new_refresh])
  end

  it 'refreshes tokens' do
    expect { call }.to change(user, :refresh).from(refresh).to(new_refresh)
    expect(call).to eq([new_access, new_refresh])
  end

  context 'when user is a guest' do
    let(:user) { create(:guest_user, refresh: refresh) }

    it 'revokes refresh token' do
      expect { call }.to change(user, :refresh).from(refresh).to(new_refresh)
      expect(call).to eq([new_access, new_refresh])
    end
  end
end
