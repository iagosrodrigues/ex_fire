defmodule FHIRTest do
  use ExUnit.Case
  doctest FHIR

  test "greets the world" do
    assert FHIR.hello() == :world
  end
end
