module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return if empty?

        return self if block.nil?

        head, *tail = self
        block.call(head)
        MyArray.new(tail).my_each(&block)
        self # return the same value for use in the chain of functions
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |result, el| result << yield(el) }
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |el| result << el unless el.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |el| acc = acc.nil? ? el : yield(acc, el) }
        acc
      end
    end
  end
end
