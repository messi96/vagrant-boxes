require 'spec_helper'
describe 'oracle_xe' do

  context 'with defaults for all parameters' do
    it { should contain_class('oracle_xe') }
  end
end
