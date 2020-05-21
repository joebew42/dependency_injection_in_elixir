defmodule Example2 do
  def send_greetings() do
    employees().all()
    |> Enum.filter(fn employee -> birthday_today?(employee) end)
    |> Enum.map(fn employee -> greeting_message().create(employee) end)
    |> Enum.each(fn message -> greeting_message_sender().send(message) end)
  end

  defp birthday_today?(_employee) do
    true
  end

  defp employees() do
    Application.fetch_env!(:example, :employees)
  end

  defp greeting_message() do
    Application.fetch_env!(:example, :greeting_message)
  end

  defp greeting_message_sender() do
    Application.fetch_env!(:example, :greeting_message_sender)
  end
end
