# frozen_string_literal: true
class NullUser
  def name
    nil
  end

  def image_url
    ''
  end

  def persisted?
    false
  end
end
