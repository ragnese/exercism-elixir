defmodule SecretHandshake do
  use Bitwise, only_operators: true

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    list = if (1 &&& code) != 0 do
      ["wink"]
    else
      []
    end
      
    list = list ++ if (2 &&& code) != 0 do
      ["double blink"]
    else
      []
    end
      
    list = list ++ if (4 &&& code) != 0 do
      ["close your eyes"]
    else
      []
    end
      
    list = list ++ if (8 &&& code) != 0 do
      ["jump"]
    else
      []
    end

    if (16 &&& code) != 0 do
      Enum.reverse(list)
    else
      list
    end
  end
end

