require 'spec_helper'
describe 'iptables' do

  context 'with defaults for all parameters' do
    it { should contain_class('iptables') }
  end
end
