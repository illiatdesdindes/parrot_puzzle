defmodule Crypt do
  @alphabet 'ABCDEFGHIJKLMNOPQRSTUVWXYZ. :/'

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
  defp encode([hp|tp] = _phrase, [hk|tk] = _key) when hp in @alphabet do
    encoded_letter = rem(to_i(hp) + to_i(hk), length(@alphabet)) |> to_char
    [encoded_letter | encode(tp, tk)]
  end

  defp decode([], _), do: []
  defp decode([hs|ts] = _secret, [hk|tk] = _key) when hs in @alphabet do
    decoded_letter = rem(to_i(hs) - to_i(hk) + length(@alphabet), length(@alphabet)) |> to_char
    [decoded_letter | decode(ts, tk)]
  end

  defp to_i(char_number) do
    Enum.find_index(@alphabet, &(&1 == char_number))
  end

  defp to_char(integer) do
    Enum.at(@alphabet, integer)
  end
end
