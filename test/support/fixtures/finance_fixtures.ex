defmodule FinancialApp.FinanceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FinancialApp.Finance` context.
  """

  @doc """
  Generate a receita.
  """
  def receita_fixture(attrs \\ %{}) do
    {:ok, receita} =
      attrs
      |> Enum.into(%{
        categoria: "some categoria",
        data: ~D[2024-11-17],
        nome: "some nome",
        valor: "120.5"
      })
      |> FinancialApp.Finance.create_receita()

    receita
  end
end
