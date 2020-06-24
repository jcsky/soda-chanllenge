json.extract! item, :id, :title, :comment, :star, :completed_at, :deadline_at, :created_at, :updated_at
json.url item_url(item, format: :json)
