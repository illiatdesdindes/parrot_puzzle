defmodule Parrot do
  @secret   'GIMWRJXBDXPRTLCEZ:CFSBIDEQCANCFGSEEFAQOCSSUKRPQAQ/OKSOET'
  @key      0x4245424F50


  def decode_hexa_key do
    String.to_char_list <<@key::40>>
  end


end
