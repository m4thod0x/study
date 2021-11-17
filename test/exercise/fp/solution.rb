module Exercise
  module Fp
    class << self
      def check_condition(film)
        # checking the conditions for the selection of films
        # for the first task
        !film['rating_kinopoisk'].nil? && !film['rating_kinopoisk'].to_f.zero? &&
          !film['country'].nil? && (film['country'].split(',').count >= 2)
      end

      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        # film ratings selected in the chain of functions select and map
        # then calculate average rating
        mapped_arr = array.select { |film| check_condition(film) }
                          .map { |film| film['rating_kinopoisk'].to_f }
        mapped_arr.reduce(0) { |sum, rating| sum + rating } / mapped_arr.count
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'] && (film['rating_kinopoisk'].to_f >= threshold) }
             .map { |film| film['name'] }
             .reduce(0) { |sum, name| sum + name.count('и') }
      end
    end
  end
end
