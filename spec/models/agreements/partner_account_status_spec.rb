require 'rails_helper'

RSpec.describe Agreements::PartnerAccountStatus, type: :model do
  describe 'validations and associations' do
    subject { build(:partner_account_status) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:order) }
    it { is_expected.to validate_uniqueness_of(:order) }
    it { is_expected.to validate_numericality_of(:order).only_integer }

    it { is_expected.to have_many(:partner_accounts) }
  end

  describe '#partner_name' do
    it 'returns the partner_name if set' do
      status = build(:partner_account_status, name: 'foo', partner_name: 'bar')
      expect(status.partner_name).to eq('bar')
    end

    it 'returns the name if no partner_name is set' do
      status = build(:partner_account_status, name: 'foo', partner_name: nil)
      expect(status.partner_name).to eq('foo')
    end
  end
end
