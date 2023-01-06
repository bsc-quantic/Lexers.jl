using Test

include("Tokens.jl")
include("Lexers/Lexers.jl")

using Aqua
import Lexers
Aqua.test_all(Lexers)
