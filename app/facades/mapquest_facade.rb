# class MapquestFacade
#   def initialize
#     @service = MapquestService.new
#   end

#   def get_location(location)
#     @service.get_location(location)[:results].select do |data|
#       data[:locations].select do |location|
#         Mapquest.new(location[:latLng])
#       end
#     end
#   end
# end