class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :place_type, :neighborhood, :description
end
