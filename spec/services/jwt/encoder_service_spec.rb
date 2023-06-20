# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Jwt::EncoderService do
  subject(:call) { described_class.call(payload: payload, token_type: type) }

  let(:payload) { { data: 'info' } }
  let(:type) { :access }

  it 'encodes payload' do
    expect(JWT.decode(call, Jwt::Helper.secret, verify: true)[0].symbolize_keys).to include(payload)
  end

  context 'when refresh generated' do
    let(:type) { :refresh }

    it 'encodes payload' do
      expect(JWT.decode(call, Jwt::Helper.secret, verify: true)[0].symbolize_keys).to include(payload)
    end
  end
end
