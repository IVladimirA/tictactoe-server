# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Jwt::IssuerService do
  subject(:call) { described_class.call(user: user) }

  let(:user) { create(:user) }

  before do
    allow(Jwt::EncoderService).to receive(:call).with(payload: anything).and_return('access')
    allow(Jwt::EncoderService).to receive(:call).with(payload: anything, token_type: :refresh).and_return('refresh')
  end

  it 'issues new tokens' do
    expect { call }.to change(user, :refresh).from(nil).to('refresh')
    expect(call).to eq(%w[access refresh])
  end

  context 'when user is a guest' do
    let(:user) { create(:guest_user) }

    it 'issues new tokens' do
      expect { call }.to change(user, :refresh).from(nil).to('refresh')
      expect(call).to eq(%w[access refresh])
    end
  end
end
