require 'spec_helper'

class User
  include Recommendable
end

describe Recommendable::Association do
  it 'raises an ArgumentError if the target is not a class' do
    expect { Association.new(User, Module) }.to raise_error
  end
end
