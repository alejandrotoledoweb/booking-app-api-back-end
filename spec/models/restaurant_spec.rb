require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { should have_many(:appointments) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:avatar_link) }
end
