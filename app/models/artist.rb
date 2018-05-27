class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  validates_presence_of :name
  validates_uniqueness_of :name

  def number_of_albums
    Album.where(artist_id: self.id).count
  end

  def range_of_years
    years = Album.select('year').where(artist_id: self.id)
    case years.length
    when 0
      return ""
    when 1
      return "#{years.first.year}"
    else
      sorted_years = years.sort
      first_year = sorted_years.first.year
      last_year = sorted_years.last.year
      return "#{first_year}-#{last_year}"
    end
  end

  def common_words
    #create an array of words from the titles
    words = split_title_to_words(Album.where(artist_id: self.id))
    #count the occurances of each word in the array
    word_list = generate_word_list(words)
    #choose the top 5 ocurring words
    max_five_words(word_list)
  end

  def split_title_to_words(titles)
    titles.map do |album|
      album.title.downcase.gsub(/[^a-z]/, " ").split(" ")
    end.flatten
  end

  def generate_word_list(words)
    words.each_with_object({}) do |word, word_list|
      word_list[word] ? word_list[word] += 1 : word_list[word] = 1
    end
  end

  def max_five_words(word_list)
    word_list.max_by(5) { |key, value| value }.map { |pair| pair[0] }
  end
end
