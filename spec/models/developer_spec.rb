require 'rails_helper'

describe Developer do
  it { should validate_presence_of(:name) }
end
