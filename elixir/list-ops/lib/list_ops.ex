defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    count(l, 0)
  end

  @spec count(list) :: non_neg_integer
  defp count([], acc), do: acc
  defp count([_h | t], acc), do: count(t, acc + 1)

  @spec reverse(list) :: list
  def reverse(list) do
    reverse(list, [])
  end

  @spec reverse(list, list) :: list
  defp reverse([], rev), do: rev
  defp reverse([h | t], rev), do: reverse(t, [h | rev])

  @spec map(list, (any -> any)) :: list
  def map([], _f), do: []
  def map([h | t], f) do
    [f.(h) | map(t, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(l, acc, f) do
  end

  @spec append(list, list) :: list
  def append(a, b) do
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
  end
end
