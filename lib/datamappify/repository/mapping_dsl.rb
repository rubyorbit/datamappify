module Datamappify
  module Repository
    module MappingDSL
      include LazyChecking

      # If the entity is lazy loaded then it assigns
      # the repository itself back to the entity
      #
      # @param entity_class [Class]
      #
      # @return [void]
      def for_entity(entity_class)
        data_mapper.entity_class = entity_class

        assign_to_entity if lazy_load?
      end

      # @param provider_name [String]
      #   name of data provider
      #
      # @return [void]
      def default_provider(provider_name)
        data_mapper.default_provider_name = provider_name.to_s
      end

      # @param (see Data::Mapper::Attribute#initialize)
      #
      # @return [void]
      def map_attribute(name, source)
        data_mapper.custom_mapping[name] = source
      end
    end
  end
end
