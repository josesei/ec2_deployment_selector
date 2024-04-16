# require "colorize"

# module Ec2DeploymentSelector
#   module Wrappers
#     class Ec2Instance
#       REGION_DISPLAY_NAMES = {
#         "us-east-2a" => "Ohio (us-east-2)",
#         "us-west-2b" => "Oregon (us-west-2)",
#       }
#       CHEF_STATUS_TAG_KEY = "ChefStatus"
#       NAME_TAG_KEY = "Name"
#       LAYERS_TAG_KEY = "Layers"

#       attr_reader :number

#       def initialize(instance, number)
#         self.object = instance
#         self.number = number
#       end

#       def public_ip_address
#         object.public_ip_address
#       end

#       def deployable?
#         # TODO: include chef status
#         object.state.name == "running"
#       end

#       def name
#         tag_value(NAME_TAG_KEY)
#       end

#       def state
#         object.state.name == "running" ? object.state.name.colorize(:green) : object.state.name.colorize(:red)
#       end

#       def layers
#         tag_value(LAYERS_TAG_KEY)
#       end

#       def region
#         REGION_DISPLAY_NAMES[object.placement.availability_zone.chomp] || "Mapping missing (#{object.placement.availability_zone})"
#       end

#       def chef_status
#         if chef_status_value.downcase == "online"
#           chef_status_value&.colorize(:green)
#         else
#           chef_status_value&.colorize(:red)
#         end
#       end

#       private
#       attr_accessor :object
#       attr_writer :number

#       def chef_status_value
#         @chef_status ||= tag_value(CHEF_STATUS_TAG_KEY) || "unknown"
#       end

#       def tag_value(key)
#         object.tags.detect { |tag| tag.key == key }&.value
#       end
#     end
#   end
# end
