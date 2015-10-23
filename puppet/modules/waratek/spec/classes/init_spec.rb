require 'spec_helper'
describe 'waratek_java' do

  context 'with defaults for all parameters' do
    it { should contain_class('waratek_java') }
  end
end
