module FindMax
  module Modules
    # For beutiful output to console
    module Info
      def error_message(message)
        warn message.colorize(:red)
      end

      def info(message)
        puts message.colorize(:blue)
      end

      def result(arr)
        puts I18n.t('result.title').colorize(:green)
        puts arr.to_s.colorize(:green)
      end
    end
  end
end
