module FindMax
  module Modules
    # For compact check number
    module CheckTypes
      def number?(obj)
        obj.to_s == obj.to_i.to_s
      end
    end
  end
end
