module Mongoid
  module Document
    def self.included(base)
      base.class_eval do
        def self.primary_key
          'id'
        end
      end
    end
  end
end



module BSON
  class ObjectId
    def as_json(options = {})
      to_s
    end
  end
end

module Moped
  module BSON
    ObjectId = ::BSON::ObjectId

    class Document < Hash
      class << self
        def deserialize(io, document = new)
          __bson_load__(io, document)
        end

        def serialize(document, io = "")
          document.__bson_dump__(io)
        end
      end
    end
  end
end


module ActiveAdmin
  module Filters
    module FormtasticAddons
      def klass
        @object.class
      end
 
      def polymorphic_foreign_type?(method)
        false
      end
    end
  end
end