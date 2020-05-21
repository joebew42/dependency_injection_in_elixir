import Config

config :example,
  employees: Employees,
  greeting_message: GreetingMessage,
  greeting_message_sender: GreetingMessageSender

import_config "#{Mix.env()}.exs"
