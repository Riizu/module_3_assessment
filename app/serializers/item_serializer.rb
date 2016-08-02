class ItemSerializer < ActiveModel::Serializer
  attributes :name, :description, :image_url, :created_at, :updated_at

  def created_at
    object.created_at.to_s
  end

  def updated_at
    object.updated_at.to_s
  end
end
