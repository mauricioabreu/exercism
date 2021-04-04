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
  def filter([], _f) do
    []
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([h | t], f) do
    if f.(h) do
      [h | filter(t, f)]
    else
      filter(t, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _f) do
    acc
  end

  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([h | t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list
  def append([], []) do
    []
  end

  @spec append(list, list) :: list
  def append([h|t], l2) do
    [h | append(t, l2)]
  end
  def append([], l2), do: l2

  @spec concat([[any]]) :: [any]
  def concat([]) do
    []
  end

  @spec concat([[any]]) :: [any]
  def concat([h | t]) do
    append(h, concat(t))
  end
end
