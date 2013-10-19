require 'spec_helper'

module SpellChecker
  describe Checker do

    def check(word)

      Checker.new().check(word)
    end

    describe '#check' do

      context 'iphone' do
        let(:word){ 'iphone' }
        it{ check('iphine').should eql word }
        it{ check('ifone').should eql word }
        it{ check('iphune').should eql word }
      end

      context 'nummerbehoud' do
        let(:word){ 'nummerbehoud' }
        it{ check('nummerbhoud').should eql word }
        it{ check('nummerbehoudt').should eql word }
      end

    end
  end
end
