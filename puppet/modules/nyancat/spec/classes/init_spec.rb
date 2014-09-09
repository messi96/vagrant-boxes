require 'spec_helper'
describe 'nyancat' do

  context 'with defaults for all parameters' do
    it { should contain_class('nyancat') }
  end
end
