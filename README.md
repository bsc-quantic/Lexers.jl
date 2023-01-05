# Lexers.jl

[![CI](https://github.com/bsc-quantic/Lexers.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/bsc-quantic/Lexers.jl/actions/workflows/CI.yml)

`Lexers` is a Julia library for easy implementation of lexers (aka _tokenizers_).

It has no dependencies and works with Julia 1.6 onwards.

## Usage

One of the interesting selling points of `Lexers` is that the different `Token` and `Lexer` kinds are implemented into the type system.

For example, a minimal lexer for the [Brainfuck](https://esolangs.org/wiki/Brainfuck) language can be implemented as
```julia
using Lexers

Brainfuck = Lexer{Tuple{GreaterThan, LessThan, Plus, Minus, Dot, Comma, BracketsLeft, BracketsRight}}
```

where `GreaterThan`, `LessThan`, `Plus`, ... are token types.

In order to _lex_ or _tokenize_ a code string, call the `tokenize` function.
```julia
julia> tokenize(Brainfuck, "[->+<]")
6-element Vector{Token}:
 "[": Bracket left
 ">": Greater than
 "+": Plus
 "-": Minus
 "<": Less than
 "]": Bracket right
```
