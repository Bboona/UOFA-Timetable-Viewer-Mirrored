require "test_helper"

class ClashesIndexTest < ActionDispatch::IntegrationTest

  test "index with clashes" do
    get clashes_path
    assert_select 'table.table'
  end

end
