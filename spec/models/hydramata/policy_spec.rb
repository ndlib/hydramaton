require 'spec_helper'

describe Hydramata::Policy do
  context '#elements' do
    subject { FactoryGirl.create(:hydramata_policy) }
    its(:elements) { should be_a_kind_of(ActiveRecord::Associations::CollectionProxy) }
  end
  context '.query' do
    it do
      Hydramata::Policy.query(resource_types: 'Article').all
    end
  end
end
