module SpellChecker
  class Dictionary

    attr_reader :index, :words, :nwords

    def initialize(file = DICTIONARY_PATH)
      file = File.open(file, 'r')
      @nwords = train(scan_words(file.read))
      @words = file.read.split(/ /).sort
      @index = {}
      create_dictionary_heap
    end

    def create_dictionary_heap
      LETTERS.each_char do |letter|
        @index[letter] = []
        @words.each do |word|
          @index[letter] << word if word[0,1] == letter
        end
      end
    end

    def scan_words(text)
      text.downcase.scan(/[a-z]+/)
    end

    def train(features)
      model = Hash.new(1)
      features.each {|f| model[f] += 1 }
      model
    end

  end
end