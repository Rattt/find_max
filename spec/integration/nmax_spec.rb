require 'spec_helper'

describe 'Console command nmax' do
  describe 'Incorrect arguments' do
    context 'bad_number' do
      command "echo '25 12 4' | nmax  bad_number"
      its(:stderr) { is_expected.to include(I18n.t('help.need_help')) }
    end

    context 'empty number' do
      command "echo '25 12 4' | nmax"
      its(:stderr) { is_expected.to include(I18n.t('help.need_help')) }
    end

    context 'excess arguments' do
      command "echo '25 12 4' | nmax 3 qw"
      its(:stderr) { is_expected.to include(I18n.t('help.need_help')) }
    end
  end

  describe 'Correct use' do
    context 'numbers [12, 25, 4] max numbers 2' do
      command "echo '12, 25, 4' | nmax  2"

      its(:stdout) { is_expected.to include('[12, 25]') }
      its(:stderr) { is_expected.to eq '' }
    end

    context 'with numbers [9, 7, 34, 1, 2, 34, 6,  4] and max numbers 4' do
      command "echo '9, 7, 34, 1, 2, 34, 6,  4' | nmax  4"

      its(:stdout) { is_expected.to include('[6, 7, 9, 34]') }
      its(:stderr) { is_expected.to eq '' }
    end

    context 'numbers [12321 234 435 456 546  23 655555555 12323 65 23 5 1] max numbers 6' do
      file_ptah = File.join(File.expand_path('../../', __FILE__), 'test_data', 'numbers.txt').to_s
      command "cat #{file_ptah} | nmax  6"

      its(:stdout) do
        is_expected.to include('[435, 456, 546, 12321, 12323, 655555555]')
      end
      its(:stderr) { is_expected.to eq '' }
    end
  end
end
