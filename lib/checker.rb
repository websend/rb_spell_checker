module SpellChecker
  class Checker

    def self.check(word, dictionary)
      new(dictionary).check(word)
    end

    def initialize(dictionary = DICTIONARY_PATH)
      @word = word.strip.downcase
      @dictionary = Dictionary.new(dictionary)
    end

    def check
      suggestion = @word.squeeze
      return suggestion if no_correction?(suggestion)
      # correct
      found_word = correct(suggestion)
      if found_word == suggestion
        @word
      else
        found_word
      end
    end

    private

    def no_correction?(word)
      letter = word[0,1]
      return false if @dictionary.index[letter].nil?
      @dictionary.index[letter].each do |w|
        return true if (word == w)
      end
      return false
    end

    def words
      @dictionary.words
    end

    def nwords
      @dictionary.nwords
    end

    def correct(word)
      (known([word]) or known(edits1(word)) or known_edits2(word) or
        [word]).max {|a,b| nwords[a] <=> nwords[b] }
    end

    def edits1(word)
      n = word.length
      deletion = (0...n).collect {|i| word[0...i]+word[i+1..-1] }
      transposition = (0...n-1).collect {|i| word[0...i]+word[i+1,1]+word[i,1]+word[i+2..-1] }
      alteration = []
      n.times {|i| LETTERS.each_byte {|l| alteration << word[0...i]+l.chr+word[i+1..-1] } }
      insertion = []
      (n+1).times {|i| LETTERS.each_byte {|l| insertion << word[0...i]+l.chr+word[i..-1] } }
      result = deletion + transposition + alteration + insertion
      result.empty? ? nil : result
    end

    def known_edits2(word)
      result = []
      edits1(word).each {|e1| edits1(e1).each {|e2| result << e2 if nwords.has_key?(e2) }}
      result.empty? ? nil : result
    end

    def known(words)
      result = words.find_all {|w| nwords.has_key?(w) }
      result.empty? ? nil : result
    end

  end
end