module TimestampStateFields
  extend ActiveSupport::Concern

  module ClassMethods
    # Implements ActiveRecord state fields based on timestamp columns.
    #
    # Requires a column in the model to have :`state`_at
    #
    # Example:
    #
    #   class User < ActiveRecord::Base
    #     include TimestampStateFields
    #     timestamp_state_fields :subscribed_at, :verified_at
    #   end
    #
    #   u = User.new
    #   u.mark_as_subscribed
    #   u.subscribed_at   # => "2015-11-15 22:51:13 -0800"
    #   u.subscribed?     # => true
    #
    #   User.subscribed.count               # Number of subscribed users
    #   User.subscribed.not_verified.count  # Number of unsubscribed users that are not verified
    #
    def timestamp_state_fields(*timestamps)
      timestamps.map(&:to_s).each do |timestamp|
        Raise ArgumentError.new("Timestamp name should end with '_at'") unless timestamp.end_with?("_at")
        state = timestamp.sub(/_at$/, '')

        define_singleton_method(:"#{state}") do
          where.not(timestamp => nil)
        end

        define_singleton_method(:"not_#{state}") do
          where(timestamp => nil)
        end

        define_method(:"#{state}?") do
          read_attribute(timestamp).present?
        end

        define_method(:"not_#{state}?") do
          read_attribute(timestamp).blank?
        end

        define_method(:"mark_as_#{state}") do
          write_attribute(timestamp, Time.current)
        end

        define_method(:"mark_as_not_#{state}") do
          write_attribute(timestamp, nil)
        end
      end
    end
  end
end
