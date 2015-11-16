defmodule Parrot do
  @secret   'GIMWRJXBDXPRTLCEZ:CFSBIDEQCANCFGSEEFAQOCSSUKRPQAQ/OKSOET'
  @key      0x4245424F50


  def decrypt_url do
    Crypt.decrypt(@secret, decrypt_hexa_key)
  end

  def decrypt_hexa_key do
    String.to_char_list <<@key::40>>
  end

end
