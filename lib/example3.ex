defmodule Example3 do
  def send_greetings(
        employees \\ Employees,
        greeting_message \\ GreetingMessage,
        greeting_message_sender \\ GreetingMessageSender
      ) do
    employees.all()
    |> Enum.filter(fn employee -> birthday_today?(employee) end)
    |> Enum.map(fn employee -> greeting_message.create(employee) end)
    |> Enum.each(fn message -> greeting_message_sender.send(message) end)
  end

  defp birthday_today?(_employee) do
    true
  end
end
