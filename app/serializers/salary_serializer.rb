class SalariesSerializer
  include JSONAPI::Serializer
  attributes :id, :type, :city, :forecast, :salary_data
end