defmodule FinancialApp.FinanceTest do
  use FinancialApp.DataCase

  alias FinancialApp.Finance

  describe "receitas" do
    alias FinancialApp.Finance.Receita

    import FinancialApp.FinanceFixtures

    @invalid_attrs %{categoria: nil, data: nil, nome: nil, valor: nil}

    test "list_receitas/0 returns all receitas" do
      receita = receita_fixture()
      assert Finance.list_receitas() == [receita]
    end

    test "get_receita!/1 returns the receita with given id" do
      receita = receita_fixture()
      assert Finance.get_receita!(receita.id) == receita
    end

    test "create_receita/1 with valid data creates a receita" do
      valid_attrs = %{categoria: "some categoria", data: ~D[2024-11-17], nome: "some nome", valor: "120.5"}

      assert {:ok, %Receita{} = receita} = Finance.create_receita(valid_attrs)
      assert receita.categoria == "some categoria"
      assert receita.data == ~D[2024-11-17]
      assert receita.nome == "some nome"
      assert receita.valor == Decimal.new("120.5")
    end

    test "create_receita/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finance.create_receita(@invalid_attrs)
    end

    test "update_receita/2 with valid data updates the receita" do
      receita = receita_fixture()
      update_attrs = %{categoria: "some updated categoria", data: ~D[2024-11-18], nome: "some updated nome", valor: "456.7"}

      assert {:ok, %Receita{} = receita} = Finance.update_receita(receita, update_attrs)
      assert receita.categoria == "some updated categoria"
      assert receita.data == ~D[2024-11-18]
      assert receita.nome == "some updated nome"
      assert receita.valor == Decimal.new("456.7")
    end

    test "update_receita/2 with invalid data returns error changeset" do
      receita = receita_fixture()
      assert {:error, %Ecto.Changeset{}} = Finance.update_receita(receita, @invalid_attrs)
      assert receita == Finance.get_receita!(receita.id)
    end

    test "delete_receita/1 deletes the receita" do
      receita = receita_fixture()
      assert {:ok, %Receita{}} = Finance.delete_receita(receita)
      assert_raise Ecto.NoResultsError, fn -> Finance.get_receita!(receita.id) end
    end

    test "change_receita/1 returns a receita changeset" do
      receita = receita_fixture()
      assert %Ecto.Changeset{} = Finance.change_receita(receita)
    end
  end
end
