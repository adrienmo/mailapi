defmodule Mailapi.SmtpServer do

  def start_link do
    session_options = [ callbackoptions: [parse: true] ]
    smtp_port = 25
    :gen_smtp_server.start(Mailapi.SmtpHandler, [[port: smtp_port, sessionoptions: session_options]])
  end

end
