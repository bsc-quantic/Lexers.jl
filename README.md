# Lexers.jl

[![CI](https://github.com/bsc-quantic/Lexers.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/bsc-quantic/Lexers.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/bsc-quantic/Lexers.jl/branch/master/graph/badge.svg?token=RRULC0TRV8)](https://codecov.io/gh/bsc-quantic/Lexers.jl)
[![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

`Lexers` is a Julia library for easy implementation of lexers (aka _tokenizers_).

It has no dependencies and has support for Julia 1.6 and later.

## Usage

One of the interesting selling points of `Lexers` is that the different `Token` and `Lexer` kinds are implemented into the type system.

For example, a minimal lexer for the [Brainfuck](https://esolangs.org/wiki/Brainfuck) language can be implemented as
```julia
using Lexers

Brainfuck = Lexer{Tuple{GreaterThan, LessThan, Plus, Minus, Dot, Comma, BracketLeft, BracketRight}}
```

where `GreaterThan`, `LessThan`, `Plus`, ... are token types.

In order to _lex_ or _tokenize_ a code string, call the `tokenize` function.
> NOTE: This code result is not yet loyal to reality.
```julia
julia> tokenize(Brainfuck, "[->+<]")
6-element Vector{Lexeme{T, SubString{String}} where T<:Token}:
 "[" => Brackets left
 "-" => Minus
 ">" => Greater than
 "+" => Plus
 "<" => Less than
 "]" => Brackets right
```
