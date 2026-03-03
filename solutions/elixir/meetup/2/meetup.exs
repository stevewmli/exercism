defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """
  @weeks %{
    :monday => 1,
    :tuesday => 2,
    :wednesday => 3,
    :thursday => 4,
    :friday => 5,
    :saturday => 6,
    :sunday => 7,
  }

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    createDateRangeForYearMonth(year, month)
    |> filterByWeekday(weekday)
    |> filterBySchedule(schedule)
    |> Date.to_erl
  end

  defp createDateRangeForYearMonth(year, month) do
    {:ok, startDate} = Date.from_erl({year, month, 1})
    {:ok, endDate} = Date.from_erl({year, month, Date.days_in_month(startDate)})
    Date.range(startDate, endDate)
  end

  defp filterByWeekday(dateRange, weekday) do
    Enum.filter(dateRange, fn(d) -> Date.day_of_week(d) == Map.get(@weeks, weekday) end)
  end

  defp filterBySchedule(dates, :first) do
    List.first(dates)
  end

  defp filterBySchedule(dates, :second) do
    Enum.at(dates, 1)
  end

  defp filterBySchedule(dates, :third) do
    Enum.at(dates, 2)
  end

  defp filterBySchedule(dates, :fourth) do
    Enum.at(dates, 3)
  end

  defp filterBySchedule(dates, :last) do
    List.last(dates)
  end

  defp filterBySchedule(dates, :teenth) do
    Enum.filter(dates, fn(d) -> (d.day >= 13 and d.day <= 19) end)
    |> List.first
  end
end