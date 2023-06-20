# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Jwt::DecoderService do
  subject(:call) { described_class.call(token: token) }

  let(:token) { Jwt::EncoderService.call(payload: payload, token_type: type) }
  let(:payload) { { data: 'data' } }
  let(:type) { :access }

  it 'decodes token' do
    expect(call).to include(payload)
  end

  context 'when refresh token' do
    let(:type) { :refresh }

    it 'decodes token' do
      expect(call).to include(payload)
    end
  end
end
