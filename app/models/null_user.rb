# frozen_string_literal: true
class NullUser
  def id
    nil
  end

  def name
    ''
  end

  def image_url
    ''
  end

  def persisted?
    false
  end

  def feeds
    Feed.all
  end

  def stories
    Story.all
  end
end
