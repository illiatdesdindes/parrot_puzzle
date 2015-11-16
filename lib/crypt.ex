defmodule Crypt do
  @secret   'GIMWRJXBDXPRTLCEZ:CFSBIDEQCANCFGSEEFAQOCSSUKRPQAQ/OKSOET'
  @alphabet 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  @key      0x4245424F50

  def secret do
    @secret
  end

  def key do
    @key
  end

  def encrypt(phrase, key) do
    repeated_key = repeat_key(key, length(phrase))
    encode(phrase, repeated_key)
  end

  def decrypt(secret, key) do
    repeated_key = repeat_key(key, length(secret))
    decode(secret, repeated_key)
  end
    
  defp repeat_key(key, length) do
    new_key = key ++ key
    if length(new_key) > length do
      new_key
    else
      repeat_key(new_key, length)
    end
  end

  defp encode([], _), do: []
  defp encode([hp|tp] = _phrase, [hk|tk] = _key) do
    encoded_letter = rem((hp - 65) + (hk - 65), 26) + 65
    [encoded_letter | encode(tp, tk)]
  end

  defp decode([], _), do: []
  defp decode([hs|ts] = _secret, [hk|tk] = _key) do
    decoded_letter = rem((hs - 65) - (hk - 65) + 26, 26) + 65
    [decoded_letter | decode(ts, tk)]
  end

  def to_i(char_number) do
    Enum.find_index(@alphabet, &(&1 == char_number))
  end
end
