module Wego
  class Response
    def self.parse_json(response)
      JSON.parse(response, object_class: Wego::OpenStruct)
    end
  end

  class OpenStruct < ::OpenStruct
    alias :read_attribute_for_serialization :send
  end
end
