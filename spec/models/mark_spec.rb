# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mark, type: :model do
  describe 'it exists' do
    it { expect { FactoryGirl.create(:mark) }.not_to raise_error }
  end
end
