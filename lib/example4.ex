defmodule Example4 do
  @defaults [
    employees: Employees,
    greeting_message: GreetingMessage,
    greeting_message_sender: GreetingMessageSender
  ]

  def send_greetings(collaborators \\ @defaults) do
    employees = Keyword.fetch!(collaborators, :employees)
    greeting_message = Keyword.fetch!(collaborators, :greeting_message)
    greeting_message_sender = Keyword.fetch!(collaborators, :greeting_message_sender)

    employees.all()
    |> Enum.filter(fn employee -> birthday_today?(employee) end)
    |> Enum.map(fn employee -> greeting_message.create(employee) end)
    |> Enum.each(fn message -> greeting_message_sender.send(message) end)
  end

  defp birthday_today?(_employee) do
    true
  end
end
