# Encoding: utf-8

require_relative 'spec_helper'

describe file('/etc/nginx/sites-available/00-roundcube') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe server(:web) do
  describe http('/') do
    it 'is powered by PHP' do
      expect(response['X-Powered-By']).to include 'PHP'
    end

    it 'responds content including "Roundcube Webmail"' do
      expect(response.body).to include('Roundcube Webmail')
    end
  end
end
