
defmodule Calc do
  defmacro __using__(_) do
    quote do
      def op({:add, a, b}), do: a + b
      def op({:subtract, a, b}), do: a - b
      def op(_) do
        "Not implemented"
      end
    end
  end
end

defmodule Adder do
  use Calc
  def add(a, b) do
    op({:add, a, b})
  end
end


defmodule Social do
  def hashtag({:twitter, word}), do: "#" <> word <> " #twitterisgreat"

  def hashtag({:facebook, word}), do: "#" <> word <> " #facebookisgreat"

  def hashtag({network , word}), do: "#" <> word <> " ##{network}isgreat"
end
