module Exercise
  module Arrays
    class << self
      def replace(array)
        max_elem = array.reduce(0) { |max, elem| max > elem ? max : elem } # found maximum element
        array.map { |elem| elem.positive? ? max_elem : elem } # maping of condition
      end

      # Solution by uses of tail recursion
      def search(array, query)
        # order low and high index of array
        low = 0
        high = array.size - 1
        bin_search(array, query, low, high) # call of helper function
      end

      def bin_search(array, query, low, high)
        # base query when query not in array
        return -1 if low > high

        # base case when query in array
        mid = (low + high) / 2
        return mid if query == array[mid]

        # recursive call in deep
        if query < array[mid]
          bin_search(array, query, low, mid - 1)
        else
          bin_search(array, query, mid + 1, high)
        end
      end
    end
  end
end
