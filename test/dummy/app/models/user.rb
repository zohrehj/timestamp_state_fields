class User < ActiveRecord::Base
  include TimestampStateFields
  timestamp_state_fields :subscribed_at
end
