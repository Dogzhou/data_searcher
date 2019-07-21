defmodule UtilsTest do
  use ExUnit.Case
  alias DataSearcher.Utils
  import ExUnit.CaptureIO
  import Mock

  test_with_mock "get_input_with", IO, [gets: fn(_) -> "world    " end] do
    assert Utils.get_input_with("hello ->") == "world"
    assert called IO.gets("hello ->")
  end

  test ".print" do
    assert capture_io(fn -> Utils.print("print something") end) == "print something\n"
  end

  test ".split_line" do
    assert Utils.split_line() == "--------------------------------------------------"
    assert Utils.split_line("*", 20) == "********************"
  end

  test ".indent_str" do
    assert Utils.indent_str("default param") == "  default param"
    assert Utils.indent_str("start of paragraph", 4) == "    start of paragraph"
  end

  test ".wrap_str" do
    assert Utils.wrap_str("default param") == "(default param)"
    assert Utils.wrap_str("bracket", "[]") == "[bracket]"
  end

  test ".get_date" do
    assert Utils.get_date("2019-07-22T01:00:00 +10") == "2019-07-22"
  end

  test ".to_downcase_str" do
    assert Utils.to_downcase_str(true) == "true"
  end
end
