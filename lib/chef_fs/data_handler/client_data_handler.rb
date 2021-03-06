require 'chef_fs/data_handler/data_handler_base'
require 'chef/api_client'

module ChefFS
  module DataHandler
    class ClientDataHandler < DataHandlerBase
      def normalize(client, entry)
        super(client, {
          'name' => remove_dot_json(entry.name),
          'admin' => false,
          'validator' => false,
          'json_class' => 'Chef::ApiClient',
          'chef_type' => 'client'
        })
      end

      def preserve_key(key)
        return key == 'name'
      end

      def chef_class
        Chef::ApiClient
      end

      # There is no Ruby API for Chef::ApiClient
    end
  end
end
