# coding: utf-8
require 'spec_helper'
require 'iconv'

describe Import do
  before { subject.stub(:id).and_return 1 }
  describe "#parse_file" do
    context "when the file have no transaction" do
      before { subject.file = Iconv.conv('utf-8', 'iso-8859-1', File.open("#{Rails.root}/features/support/financial_empty.csv").read) }
      it("should not create transactions"){expect { subject.parse_file }.to_not change{ Transaction.count }}
    end
    context "when there is one transaction" do
      before { subject.file = Iconv.conv('utf-8', 'iso-8859-1', File.open("#{Rails.root}/features/support/purchase_on_debit_card.csv").read) }
      it("should create one transaction"){expect { subject.parse_file }.to change{ Transaction.count }.by(1)}
    end
  end

  describe "#parse_history" do
    it("should return a entity name"){subject.parse_history("Compra com Cartão - 01/05 11:02 ITUT S CONFEITARIA")[:entity_name].should be_== "Itut S Confeitaria"}
    it("should return a hour and minute"){subject.parse_history("Compra com Cartão - 01/05 11:02 ITUT S CONFEITARIA")[:hour].should be_== "11:02"}
  end
end
