defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns :world, this method is only here for testing purposes
  """
  def hello do
    :world
  end

  @doc """
    Creates a new deck of cards
  """
  def create_deck do
    values = ["First", "Second", "Third"]
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles a list of cards in a deck using the `Enum.shuffle` built-in module's method
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Save a deck of cards to the file system

  ## Examples

      iex> deck = Cards.create_deck
      iex> deck = Cards.shuffle deck #optional
      iex> Cards.save(deck, "filename")
      :ok

  """
  def save(deck, fileName) do
    binaryData = :erlang.term_to_binary(deck)
    File.write(fileName, binaryData)
  end

  def read(fileName) do
    case File.read(fileName) do
      {:ok, binaryData} -> :erlang.binary_to_term(binaryData)
      {:error, _reason} -> "File not found"
    end
  end

  @doc """
    Creates a new deck of cards, shuffles it and saves it on the filesystem
  """
  def create(fileName) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.save(fileName)
  end
end
