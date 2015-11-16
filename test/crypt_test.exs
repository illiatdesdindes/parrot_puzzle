defmodule CryptTest do
  use ExUnit.Case
  doctest Crypt

  test "identity of simple string" do
    string = 'SIMPLESTRING'
    key = 'KEY'
    assert string |> Crypt.encrypt(key) |> Crypt.decrypt(key) == string
  end

  test "identity of simple string with additonal characters" do
    string = 'STRING: WITH ADDITIONNAL. /CHARS/'
    key = 'KEY'
    assert string |> Crypt.encrypt(key) |> Crypt.decrypt(key) == string
  end

  test "identity of simple string with additonal characters reverse" do
    string = 'STRING: WITH ADDITIONNAL. /CHARS/'
    key = 'KEY'
    assert string |> Crypt.decrypt(key) |> Crypt.encrypt(key) == string
  end

end
