defmodule CryptTest do
  use ExUnit.Case
  doctest Crypt


  test "We can encrypt a text simple texte" do
    assert Crypt.encrypt('JADOREECOUTERLARADIOTOUTELAJOURNEE', 'MUSIQUE') == 'VUVWHYIOIMBULPMLSLYIXAOLMBUNAOJVUY'
  end

  test "We can decrypt a a secret" do
    assert Crypt.decrypt('VUVWHYIOIMBULPMLSLYIXAOLMBUNAOJVUY', 'MUSIQUE') == 'JADOREECOUTERLARADIOTOUTELAJOURNEE'
  end
end
