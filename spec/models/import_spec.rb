# coding: utf-8
require 'spec_helper'
require 'iconv'

describe Import do
  before { subject.stub(:id).and_return 1 }
  describe "#parse_file" do
    context "when the file have no transaction" do
      before { subject.file = Iconv.conv('utf-8', 'iso-8859-1', File.open("#{Rails.root}/features/support/financial_empty.csv").read) }
      it "should not create transactions" do
        expect { subject.parse_file }.to_not change{ Transaction.count }
      end
    end

    context "when there is one transaction" do
      before { subject.file = Iconv.conv('utf-8', 'iso-8859-1', File.open("#{Rails.root}/features/support/purchase_on_debit_card.csv").read) }
      it "should create one transaction" do
        expect { subject.parse_file }.to change{ Transaction.count }.by(1)
      end
    end
  end

  describe "#parse_history" do
    context "when it's a debit card purchase" do
      it "should return a entity name" do
        subject.parse_history("Compra com Cartão - 01/05 11:02 ITUT S CONFEITARIA")[:entity_name].should be_== "Itut S Confeitaria"
      end
    end
    context "when it's a eletronic transfer" do
      it "should return a entity name" do
        subject.parse_history("TED Transf.Eletr.Disponív - 033 4340  7340306000136 BIAZUS E LULKI")[:entity_name].should be_== "Biazus E Lulki"
      end
    end
  end
end
