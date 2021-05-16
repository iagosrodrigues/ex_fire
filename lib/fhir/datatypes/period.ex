defmodule FHIR.Datatypes.Period do
  alias FHIR.Datatypes.Period, as: Period

  @moduledoc """
  Period datatype.
  """

  defstruct [:start, :end]

  def new(start_date, end_date) do
    start_date = to_date(start_date)
    end_date = to_date(end_date)

    cond do
      is_nil(start_date) and is_nil(end_date) -> {:error, :invalid_format}
      not is_valid_range?(start_date, end_date) -> {:error, :invalid_range}
      true -> {:ok, %Period{start: start_date, end: end_date}}
    end
  end

  def to_date(value) when is_binary(value) do
    case Date.from_iso8601(value) do
      {:ok, date} -> date
      {:error, _} -> nil
    end
  end

  def to_date(_), do: nil

  def is_valid_range?(start_date, end_date) do
    case is_nil(start_date) or is_nil(end_date) do
      true -> true
      false -> Date.diff(end_date, start_date) >= 1
    end
  end
end
