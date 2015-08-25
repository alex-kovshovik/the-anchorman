include ActionView::Helpers::DateHelper

class ToiletSerializer < ActiveModel::Serializer
  attributes :id, :group_id, :state, :name, :description, :gender, :created_at, :updated_at, :last_keep_alive_at
end
