defmodule PeriodTest do
  alias FHIR.Datatypes.Period, as: Period

  use ExUnit.Case, async: true

  doctest Period

  describe "missing dates" do
    test "accepts if only start is missing" do
      {:ok, %Period{start: nil, end: end_date}} = Period.new(nil, "2021-01-01")

      assert end_date == ~D[2021-01-01]
    end

    test "accepts if only end is missing" do
      {:ok, %Period{start: start_date, end: nil}} = Period.new("2021-01-01", nil)

      assert start_date == ~D[2021-01-01]
    end

    test "rejects if all date is missing" do
      {:error, reason} = Period.new(nil, nil)

      assert :invalid_format == reason
    end
  end

  test "rejects when the range is invalid" do
    {:error, reason} = Period.new("2020-02-01", "2020-01-01")

    assert :invalid_range = reason
  end

  test "accepts otherwise" do
    {:ok, date} = Period.new("2020-02-01", "2020-03-01")

    assert %Period{start: ~D[2020-02-01], end: ~D[2020-03-01]} == date
  end
end
