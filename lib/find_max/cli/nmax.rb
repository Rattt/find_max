module FindMax
  module Cli
    # Check args nmax before run
    class Nmax
      include FindMax::Modules::CheckTypes

      def initialize(args)
        @args = args
      end

      def execute
        check_errors!
        run_command
      end

      private

      def run_command
        @count_max_numbers = @args[0].to_i
        FindMax::Commands::FindMaxNumbers.new(@count_max_numbers).execute
      end

      def check_errors!
        errors = []
        l = ->(str) { errors << str }
        I18n.with_options('errors.arguments') do |err|
          l.call(err.call('.empty_file')) if $stdin.tty?
          l.call(err.call('.unknown_arguments')) if @args.length > 1
          l.call(err.call('.empty_max_number')) if @args.empty?
          l.call(err.call('.incorrect_max_number')) unless is_number? @args[0]
        end
        raise ArgumentError, errors.join("\n") if errors.any?
      end
    end
  end
end
