module SpellChecker
  LETTERS = ('a'..'z').to_a.join
  DICTIONARY_PATH = File.join(File.dirname(__FILE__), 'support', 'dictionary.dat')
end

require 'lib/checker'
require 'lib/dictionary'