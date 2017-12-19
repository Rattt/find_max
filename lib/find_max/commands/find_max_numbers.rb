module FindMax
  module Commands
    # Find N Max numbers in File
    class FindMaxNumbers
      include FindMax::Modules::Info

      def initialize(count)
        @count = count
        @count_n = -@count
      end

      def execute
        @numbers = Immutable::SortedSet.new
        numbers = []
        length = 0
        $stdin.each_line do |line|
          numbers = line.scan(/\d+/).map(&:to_i) || []
          length = @numbers.length
          @numbers = @numbers[@count_n..-1] if @count < length
          numbers_to_set(numbers, length) if numbers.any?
        end
        numbers_to_set(numbers, length)
        length = @numbers.length
        @numbers = @numbers[@count_n..-1] if @count < length
        @numbers.to_a
      end

      private

      def numbers_to_set(numbers, length)
        results_full = @count < length + 1
        min = @numbers.min
        unless results_full
          strategy_not_full(numbers, min, length)
          return
        end
        strategy_full(numbers, min)
      end

      def strategy_full(numbers, min)
        numbers.each do |number|
          next if min > number
          @numbers = @numbers << number
          min = @numbers.min
        end
      end

      def strategy_not_full(numbers, min, length)
        min = numbers.first if min.nil?
        i = 0
        numbers.each do |number|
          if min > number
            next unless @count > length + i
          end
          @numbers = @numbers << number
          min = @numbers.min
          i += 1
        end
      end
    end
  end
end
