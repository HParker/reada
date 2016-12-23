# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe 'it exists' do
    it { expect { FactoryGirl.create(:follow) }.not_to raise_error }
  end
end
