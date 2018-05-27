require 'rails_helper'

RSpec.describe Album, type: :model do
  it { should belong_to(:artist) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:condition) }
end
