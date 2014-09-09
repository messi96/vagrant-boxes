require 'spec_helper'
describe 'demo_security' do

  context 'with defaults for all parameters' do
    it { should contain_class('demo_security') }
  end
end
