require 'chef_fs/data_handler/data_handler_base'

module ChefFS
  module DataHandler
    class UserDataHandler < DataHandlerBase
      def normalize(user, entry)
        super(user, {
          'name' => remove_dot_json(entry.name),
          'admin' => false
        })
      end

      def preserve_key(key)
        return key == 'name'
      end

      # There is no chef_class for users, nor does to_ruby work.
    end
  end
end
