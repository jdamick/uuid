require File.join(File.dirname(__FILE__), 'test_helper')

class UuidTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "uuid generate" do
    uuid_str1 = UUID.generate()
    assert_not_nil uuid_str1
    uuid_str2 = UUID.generate()
    assert_not_nil uuid_str2
    assert_not_equal uuid_str1, uuid_str2
  end
  
  def test_class_generate 
    uuid = UUID.new
    assert_match(/\A[\da-f]{32}\z/i, UUID.generate(:compact))

    assert_match(/\A[\da-f]{8}-[\da-f]{4}-[\da-f]{4}-[\da-f]{4}-[\da-f]{12}\z/i,
                 UUID.generate(:default))

    assert_match(/^urn:uuid:[\da-f]{8}-[\da-f]{4}-[\da-f]{4}-[\da-f]{4}-[\da-f]{12}\z/i,
                 UUID.generate(:urn))

    e = assert_raise ArgumentError do
      UUID.generate :unknown
    end
    assert_equal 'invalid UUID format :unknown', e.message
  end
end
