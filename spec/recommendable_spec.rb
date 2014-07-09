require 'spec_helper'
require 'recommendable/core'

class Movie; end

class User
  include Recommendable

  recommended :movies
end

describe Recommendable do
  it 'defines a list of recommendables' do
    expect(User._recommendables[:movies]).to eq(Movie)
  end

  describe '.recommended' do
    it 'raises a NameError if the recommendable has no associated class' do
      expect { User.recommended(:books) }.to raise_error
    end
  end
end
