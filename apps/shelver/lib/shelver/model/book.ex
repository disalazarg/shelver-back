defmodule Shelver.Model.Book do
  @moduledoc """
  In-memory struct for storing Book data
  """
  use Reflex.Model

  defstruct id: nil, title: nil, author: nil, description: nil
end
