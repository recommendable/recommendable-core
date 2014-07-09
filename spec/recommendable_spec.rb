require 'spec_helper'

class User
  include Recommendable
end

class Movie; end

describe Recommendable do
  it 'defines a list of recommendables' do
    expect(User._recommendables).to eq({})
  end

  describe '.recommended' do
    it 'raises a NameError if the recommendable has no associated class' do
      expect { User.recommended(:books) }.to raise_error
    end

    it 'creates an Association for the recommended class' do
      User.recommended(:movies)

      expect(User._recommendables[:movies]).to be_instance_of(Recommendable::Association)
    end
  end

  after do
    User._recommendables.clear
  end
end
