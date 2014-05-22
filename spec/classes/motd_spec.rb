require 'spec_helper'

describe 'motd', :type => :class do

  describe 'On a non-linux system' do
    let(:facts) {{ :kernel => 'Unknown' }}
    it "should not fail" do
      expect do
        subject
      end.not_to raise_error()
    end
    it { should_not contain_file('/etc/motd') }
  end
  
  describe "On Linux - no ::domain"
    let(:facts) {{
      :kernel => 'Linux',
      :operatingsystem => 'TestOS',
      :memoryfree => '1 KB'
    }}
    context 'When ::domain is not present and a template has not been specified' do
      it { should contain_File('/etc/motd').with(
        :ensure => 'file',
        :backup => 'false',
        :content => "The operating system is TestOS\nThe free memory is 1KB\n"
      )
    end
  end

  describe "On Linux" do
    let(:facts) {{
      :kernel          => 'Linux',
      :operatingsystem => "TestOS",
      :memoryfree      => "1 KB",
      :domain          => "testdomain"
    }}
    context "When a motd template is not specified" do
      it { should contain_File('/etc/motd').with(
        :ensure  => 'file',
        :backup  => 'false',
        :content => "The operating system is TestOS\nThe free memory is 1 KB\nThe domain is testdomain\n"
        )
      }
    end
    context "When an external template is specified" do
      let(:params) { { :template => 'motd/spec.erb' } }
      it { should contain_File('/etc/motd').with(
        :ensure  => 'file',
        :backup  => 'false',
        :content => "Test Template for Rspec\n"
        ) 
      }
    end   
  end

end

