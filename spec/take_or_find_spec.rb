# frozen_string_literal: true

require "spec_helper"
require "activerecord-take_or_find"

shared_examples :any_model do
  let(:model) { described_class }
  let(:instance) { model.create! }

  it "returns the same instance when instance is passed" do
    expect(model.take_or_find(instance)).to be instance
  end

  it "returns an instance when it's id is passed" do
    expect(model.take_or_find(instance.id)).to eq instance
  end
end

describe SomeObject do
  it_behaves_like :any_model

  context "when querying through parent relation" do
    let(:parent) { ParentObject.create! }
    let(:instance) { SomeObject.create!(parent_object: parent) }

    it "returns the same instance when instance is passed" do
      expect(parent.some_objects.take_or_find(instance)).to be instance
    end

    it "returns an instance when it's id is passed" do
      expect(parent.some_objects.take_or_find(instance.id)).to eq instance
    end
  end
end

describe ParentObject do
  it_behaves_like :any_model
end

describe ExtendedObject do
  it_behaves_like :any_model

  it "raises when passed instance is not of exact class" do
    instance = SomeObject.create!

    expect do
      ExtendedObject.take_or_find(instance)
    end.to raise_error(ArgumentError)
  end
end
