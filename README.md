# Parrot

A solution to Parrot [puzzle](http://jobs.humancoders.com/autres/jobs/944-ingenieurs-r-d)

## How to !

  - Install [Elixir](http://elixir-lang.org/install.html)

  - `$ git clone https://github.com/illiatdesdindes/parrot_puzzle`

  - `$ iex -S mix`

  - `iex> Parrot.decrypt_hexa_key` to see the key in it's alphabetic form

  - `iex> Parrot.decrypt_url` to decrypt the message

## Details

### The Encryption method
A quick search on Google for "Blaise 1523" bring us to the wikipedia page of *Blaise de Vigenère*. Who happen to be misattributed the paternity of the "Vigenère cipher".

This method of encryption is quite simple, I didn't have knowledge of it. As I was reading, I begin to think of creating a big 2D table for mapping the letters. And then I stumble upon the Algebraic description. Awesome :) ! It's straight forward, if you map letters to integers
`A => 0, B => 1, ... Z => 25`. You see that each box (the crypted letter) is the sum of the column header and the line header.

thus if *i* is the current index of your text, and that we add the `'.', ' ', ':', '/'` characters to our alphabet we have something like :

    Crypted[i] = (Text[i] + Key[i]) mod 30
    Text[i] = (Crypted[i] - Key[i]) mod 30

see https://github.com/illiatdesdindes/parrot_puzzle/blob/master/lib/crypt.ex#L23-L33

### The key
The key must be an alphabetic phrase so spliting that value in bytes reveals the key (see https://github.com/illiatdesdindes/parrot_puzzle/blob/master/lib/parrot.ex#L10-L12)

## Conclusion
Nice little puzzle that gave the opportunity to make some Elixir :) !

Woot !
