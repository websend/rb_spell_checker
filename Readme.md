# Ruby Spell Checker

This project is a very simple spell checker based on Peter Norvig's simple spellchecker algorithm (http://norvig.com/spell-correct.html) and uses Brian Adkins' Ruby functions (http://lojic.com/blog/2008/09/04/how-to-write-a-spelling-corrector-in-ruby/).
It uses your own word list as a dictionary. This list can be stored in a file or in a database.

## How to use

With a input string:
```
SpellChecker::Checker.new('blue purple yellow green red').check('bluu') => 'blue'
```

With a dictionary file:
**dictionary.txt**
```
blue purple yellow green red
```

**ruby**
```
dictionary = File.read('dictionary.txt')
SpellChecker::Checker.new(dictionary).check('bluu') => 'blue'
```
