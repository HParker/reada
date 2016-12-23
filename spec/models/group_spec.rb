# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Group, type: :model do
  describe 'it exists' do
    it { expect { FactoryGirl.create(:group) }.not_to raise_error }
  end
end
