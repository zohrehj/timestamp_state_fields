require 'test_helper'

class TimestampStateFieldsTest < ActiveSupport::TestCase
  setup do
    @bob = User.create(name: "Bob", subscribed_at: Time.current)
    @betty = User.create(name: "Betty")
  end

  def test_subscribed_and_not_subscribed_methods
    assert_not_nil @bob.subscribed_at
    assert_equal true, @bob.subscribed?
    assert_equal false, @bob.not_subscribed?

    assert_nil @betty.subscribed_at
    assert_equal false, @betty.subscribed?
    assert_equal true, @betty.not_subscribed?
  end

  def test_mark_as_and_mark_as_not
    @betty.mark_as_subscribed
    assert_not_nil @betty.subscribed_at

    @betty.mark_as_not_subscribed
    assert_nil @betty.subscribed_at
  end

  def test_subscribed_and_not_subscribed_scopes
    assert_includes User.subscribed, @bob
    assert_includes User.not_subscribed, @betty
  end
end
