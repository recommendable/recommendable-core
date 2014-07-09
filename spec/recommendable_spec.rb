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
    before { User.recommended(:movies) }

    it 'raises a NameError if the recommendable has no associated class' do
      expect { User.recommended(:books) }.to raise_error
    end

    it 'creates an Association for the recommended class' do
      expect(User._recommendables[:movies]).to be_instance_of(
        Recommendable::Association
      )
    end

    it 'allows accesing an association' do
      expect(User.reflect_on_recommendable(:movies)).to eq(
        User._recommendables[:movies]
      )
    end
  end

  after do
    User._recommendables.clear
  end
end
