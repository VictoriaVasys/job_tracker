require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a first_name" do
        contact = Contact.new( last_name: "Smith", position: "HR director", email: "jane@amazon.com", company_id: 1)
        expect(contact).to be_invalid
      end

      it "is invalid without a last_name" do
        contact = Contact.new(first_name: "Jane", position: "HR director", email: "jane@amazon.com", company_id: 1)
        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(first_name: "Jane", last_name: "Smith", email: "jane@amazon.com", company_id: 1)
        expect(contact).to be_invalid
      end

      it "is invalid without a email" do
        contact = Contact.new(first_name: "Jane", last_name: "Smith", position: "HR director", company_id: 1)
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a full name, position, email" do
        contact = Contact.new(first_name: "Jane", last_name: "Smith", position: "HR director", email: "jane@amazon.com", company_id: 1)
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(first_name: "Jane", last_name: "Smith", position: "HR director", email: "jane@amazon.com", company_id: 1)
      expect(contact).to respond_to(:company)
    end
  end
end