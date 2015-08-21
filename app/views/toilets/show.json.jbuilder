json.extract! @toilet, :id, :group_id, :state, :name, :description, :gender, :created_at, :updated_at
json.keep_alive_ago Time.now.utc - (@toilet.last_keep_alive_at || Time.now - 1.day)
json.state_ago time_ago_in_words(@toilet.updated_at, include_seconds: true)
