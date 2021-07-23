class ItemsSoldSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  attribute :count do
    object.item_count
  end
end
