module FindMax
  module Cli
    # Console Language Interface
    class Common
      include FindMax::Modules::CheckTypes
      include FindMax::Modules::Info

      def initialize(args)
        @args = args
      end

      def execute
        I18n.with_options('help') do |hp|
          OptionParser.new do |opts|
            opts.banner =  hp.call '.use_the_sample'
            opts.separator hp.call '.description'
            opts.on_tail('-h', '--help', hp.call('.about_help')) do
              info(opts.to_s)
              return
            end
            opts.on_tail('-v', '--version', hp.call('.version_gem')) do
              info(FindMax::VERSION)
              return
            end
            opts.parse!
          end
        end
        response = ::FindMax::Cli::Nmax.new(@args).execute
        result(response)
      rescue ArgumentError => e
        error_message(e.message + "\n" + I18n.t('help.need_help'))
      rescue StandardError => e
        error_message(e.message)
      end
    end
  end
end
