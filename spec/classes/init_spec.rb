require 'spec_helper'
describe 'gestao_previa_faturamento' do
  context 'with default values for all parameters' do
    it { should contain_class('gestao_previa_faturamento') }
  end
end
