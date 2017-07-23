
require 'spec_helper'

describe 'User' do
  before do
    @user = User.create(:username => "elranchero", :email => "elranchero@ranch.com", :password => "vivoelrancho")
  end

  it 'has a secure password' do

    expect(@user.authenticate("dog")).to eq(false)
    expect(@user.authenticate("vivoelrancho")).to eq(@user)

  end
end
