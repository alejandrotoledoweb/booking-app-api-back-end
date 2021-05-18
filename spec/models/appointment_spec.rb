require 'rails_helper'

RSpec.describe Appointment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it { should belong_to(:user) }
  it { should belong_to(:restaurant) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:status) }
end
