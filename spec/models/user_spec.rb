# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  email      :string           not null
#  image_url  :string
#  admin      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

RSpec.describe User, type: :model do
  describe '#add_provider' do
    xit 'finds a user if the user if they already have this provider' do
    end

    xit 'it creates a new user if one is not found' do
    end
  end
end
