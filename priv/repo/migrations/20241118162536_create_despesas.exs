defmodule FinancialApp.Repo.Migrations.CreateDespesas do
  use Ecto.Migration

  def change do
    create table(:despesas) do
      add :nome, :string
      add :valor, :decimal
      add :data, :date
      add :categoria, :string

      timestamps(type: :utc_datetime)
    end
  end
end
