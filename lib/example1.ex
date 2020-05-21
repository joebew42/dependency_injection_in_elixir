defmodule Example1 do
  def send_greetings() do
    Employees.all()
    |> Enum.filter(fn employee -> birthday_today?(employee) end)
    |> Enum.map(fn employee -> GreetingMessage.create(employee) end)
    |> Enum.each(fn message -> GreetingMessageSender.send(message) end)
  end

  defp birthday_today?(_employee) do
    true
  end
end
