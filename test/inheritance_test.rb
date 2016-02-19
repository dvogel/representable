require 'test_helper'
require 'minitest/autorun'

class InheritanceTest < MiniTest::Spec
  class AlbumDecorator < Representable::Decorator
    include Representable::Hash
    property :title
  end

  class IntermediateDecorator < Representable::Decorator
    include Representable::Hash
  end

  class SongDecorator < IntermediateDecorator
    property :name
  end

  class ArtistDecorator < IntermediateDecorator
    property :name
    property :date_of_birth
  end

  describe "basic inheritance" do
    it "exposes #representable_attrs" do
      AlbumDecorator.representable_attrs['title'].wont_equal(nil)
    end
  end

  describe "inheritance transitivity" do
    it "exposes #representable_attrs" do
      SongDecorator.representable_attrs['name'].wont_equal(nil)
      ArtistDecorator.representable_attrs['date_of_birth'].wont_equal(nil)
    end
  end
end

