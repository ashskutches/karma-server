require 'spec_helper'

# == Schema Information
#
# Table name: clients
#
#  id         :integer         not null, primary key
#  api_key    :string(255)     not null
#  ip_address :string(255)     not null
#  hostname   :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#
describe Client do
  before(:each) do
    @client = Client.make
  end

  it { should validate_presence_of :hostname }
  it { should validate_presence_of :ip_address }
  it { should validate_uniqueness_of :hostname }
  it { should validate_uniqueness_of :ip_address }

  it "should generate the API key automatically" do
    @client.api_key.should_not be_nil
    @client.api_key.length.should > 10
  end

end
