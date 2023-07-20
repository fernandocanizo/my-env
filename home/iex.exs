timestamp = fn -> # for use in your prompt
  {_date, {hour, minute, _second}} = :calendar.local_time
  [hour, minute]
  |> Enum.map(&(String.pad_leading(Integer.to_string(&1), 2, "0")))
  |> Enum.join(":")
end

IEx.configure(history_size: 100)

IEx.configure(
  default_prompt:
    "#{IO.ANSI.green}%prefix#{IO.ANSI.reset} " <>
    "[#{IO.ANSI.cyan}%counter#{IO.ANSI.reset}] >",

  alive_prompt:
    "#{IO.ANSI.green}%prefix#{IO.ANSI.reset} " <>
    "(#{IO.ANSI.yellow}%node#{IO.ANSI.reset}) " <>
    "[#{IO.ANSI.magenta}#{timestamp.()}#{IO.ANSI.reset} " <>
    ":: #{IO.ANSI.cyan}%counter#{IO.ANSI.reset}] >",

  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :light_black,
      boolean: :red,
      nil: [:magenta, :bright],
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline],
  ]
)

# sample data to play with
dwarves = ["Fili","Kili", "Oin", "Gloin", "Thorin", "Dwalin", "Balin", "Bifur",
  "Bofur", "Bombur", "Dori", "Nori", "Ori"]

fellowship = %{
  hobbits: ["Frodo", "Samwise", "Merry", "Pippin"],
  humans: ["Aragorn", "Boromir"],
  dwarves: ["Gimli"],
  elves: ["Legolas"],
  wizards: ["Gandalf"]
}

# utility functions

# Doesn't work for functions inside modules. Haven't verified all of them
defmodule Util do
  def whatis?(term) when is_atom(term), do: "Type: Atom"
  def whatis?(term) when is_binary(term), do: "Type: Binary"
  def whatis?(term) when is_boolean(term), do: "Type: Boolean"
  def whatis?(term) when is_bitstring(term), do: "Type: Bitstring"
  def whatis?(term) when is_boolean(term), do: "Type: Boolean"
  def whatis?(term) when is_exception(term), do: "Type: Exception"
  def whatis?(term) when is_function(term), do: "Type: Function"
  def whatis?(term) when is_list(term), do: "Type: List"
  def whatis?(term) when is_map(term), do: "Type: Map"
  def whatis?(term) when is_nil(term), do: "Type: Nil"
  def whatis?(term) when is_pid(term), do: "Type: Pid"
  def whatis?(term) when is_port(term), do: "Type: Port"
  def whatis?(term) when is_reference(term), do: "Type: Reference"
  def whatis?(term) when is_struct(term), do: "Type: Struct"
  def whatis?(term) when is_tuple(term), do: "Type: Tuple"
  def whatis?(term) when is_integer(term), do: "Type: Number, Integer"
  def whatis?(term) when is_float(term), do: "Type: Number, Float"

  def whatis?(_term), do: "Type: Unknown"
end


IO.puts("#{IO.ANSI.magenta}===> FLC configuration loaded#{IO.ANSI.reset}")
