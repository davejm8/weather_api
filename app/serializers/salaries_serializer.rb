class SalariesSerializer
  include JSONAPI::Serializer
  attributes :city, :forecast, :salaries
end