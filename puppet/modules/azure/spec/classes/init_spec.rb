require 'spec_helper'
describe 'azure' do

  context 'with defaults for all parameters' do
    it { should contain_class('azure') }
  end
end
