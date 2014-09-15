require 'spec_helper'
describe 'vagrant_base_box' do

  context 'with defaults for all parameters' do
    it { should contain_class('vagrant_base_box') }
  end
end
