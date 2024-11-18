defmodule FinancialApp.Repo do
  use Ecto.Repo,
    otp_app: :financial_app,
    adapter: Ecto.Adapters.Postgres
end
