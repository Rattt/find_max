require 'spec_helper'

describe 'Console commands info' do
  context 'help console' do
    command 'nmax  -h'

    its(:stdout) { is_expected.to include(I18n.t('help.use_the_sample')) }
    its(:stderr) { is_expected.to eq '' }
  end

  context 'version gem' do
    command 'nmax  -v'

    its(:stdout) { is_expected.to include(FindMax::VERSION) }
    its(:stderr) { is_expected.to eq '' }
  end
end
