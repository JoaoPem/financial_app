defmodule FinancialAppWeb.ReceitaHTML do
  use FinancialAppWeb, :html

  embed_templates "receita_html/*"

  @doc """
  Renders a receita form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def receita_form(assigns)
end
