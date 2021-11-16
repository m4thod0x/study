module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        mapped_arr = array.map do |film|
          rating_condition = !film['rating_kinopoisk'].nil? && !film['rating_kinopoisk'].to_f.zero?
          country_condition = !film['country'].nil? && (film['country'].split(',').count >= 2)
          film['rating_kinopoisk'].to_f if country_condition && rating_condition
        end.compact
        mapped_arr.reduce(0) { |sum, rating| sum + rating } / mapped_arr.count
      end

      def chars_count(films, threshold)
        mapped_arr = films.map do |film|
          film['name'] if !film['rating_kinopoisk'].nil? && (film['rating_kinopoisk'].to_f >= threshold)
        end.compact
        mapped_arr.reduce(0) { |sum, name| sum + name.count('и') }
      end
    end
  end
end
