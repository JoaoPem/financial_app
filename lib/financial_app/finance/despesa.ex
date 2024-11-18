defmodule FinancialApp.Finance.Despesa do
  use Ecto.Schema
  import Ecto.Changeset

  schema "despesas" do
    field :categoria, :string
    field :data, :date
    field :nome, :string
    field :valor, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(despesa, attrs) do
    despesa
    |> cast(attrs, [:nome, :valor, :data, :categoria])
    |> validate_required([:nome, :valor, :data, :categoria])
  end
end
