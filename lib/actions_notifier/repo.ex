defmodule ActionsNotifier.Repo do
  use Ecto.Repo,
    otp_app: :actions_notifier,
    adapter: Ecto.Adapters.MyXQL
end
