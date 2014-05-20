require 'spec_helper'
describe 'openfire' do

  context 'with defaults for all parameters' do
    let(:facts) { { :osfamily => 'RedHat' } }

    it { should contain_class('openfire') }
  end
end
