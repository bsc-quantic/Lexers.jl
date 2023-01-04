using Lexers: pattern, Newline, Whitespace, Quote, Dot, Comma, Colon, Semicolon, ParenthesisLeft, ParenthesisRight, BracketsLeft, BracketsRight, BracesLeft, BracesRight, Plus, Minus, Asterisk, Slash, GreaterThan, LessThan, Equal, At, Exclamation, Question, Keyword, Number

@testset "Tokens" verbose = true begin
    @testset "Newline" begin
        @test startswith("\n", pattern(Newline))
        @test_skip startswith("\r\n", pattern(Newline))
        @test startswith("\nline after newline", pattern(Newline))
        @test !startswith("line before newline\n", pattern(Newline))
    end

    @testset "Whitespace" begin
        @test startswith(" ", pattern(Whitespace)) # 1 space
        @test startswith("  ", pattern(Whitespace)) # 2 spaces
        @test !startswith("	", pattern(Whitespace)) # tab
        @test startswith(" line after whitespace", pattern(Whitespace))
        @test !startswith("line before whitespace", pattern(Whitespace))
    end

    @testset "Quote" begin
        @test startswith("\"word\"", pattern(Quote))
        @test startswith("\"line within quotes\"", pattern(Quote))
        @test !startswith("word", pattern(Quote))
        @test !startswith("line without quotes", pattern(Quote))
    end

    @testset "Dot" begin
        @test startswith(".", pattern(Dot))
        @test startswith(".24", pattern(Dot))
    end

    @testset "Comma" begin
        @test startswith(",", pattern(Comma))
    end

    @testset "Colon" begin
        @test startswith(":", pattern(Colon))
    end

    @testset "Semicolon" begin
        @test startswith(";", pattern(Semicolon))
    end

    @testset "Parenthesis" begin
        @test startswith("(", pattern(ParenthesisLeft))
        @test startswith(")", pattern(ParenthesisRight))
        @test startswith("(1,2,3)", pattern(ParenthesisLeft))
    end

    @testset "Brackets" begin
        @test startswith("[", pattern(BracketsLeft))
        @test startswith("]", pattern(BracketsRight))
        @test startswith("[1,2,3]", pattern(BracketsLeft))
    end

    @testset "Braces" begin
        @test startswith("{", pattern(BracesLeft))
        @test startswith("}", pattern(BracesRight))
        @test startswith("{1,2,3}", pattern(BracesLeft))
    end

    @testset "Plus" begin
        @test startswith("+", pattern(Plus))
    end

    @testset "Minus" begin
        @test startswith("-", pattern(Minus))
    end

    @testset "Asterisk" begin
        @test startswith("*", pattern(Asterisk))
    end

    @testset "Slash" begin
        @test startswith("/", pattern(Slash))
    end

    @testset "GreaterThan" begin
        @test startswith(">", pattern(GreaterThan))
    end

    @testset "LessThan" begin
        @test startswith("<", pattern(LessThan))
    end

    @testset "Equal" begin
        @test startswith("=", pattern(Equal))
    end

    @testset "At" begin
        @test startswith("@", pattern(At))
    end

    @testset "Exclamation" begin
        @test startswith("!", pattern(Exclamation))
    end

    @testset "Question" begin
        @test startswith("?", pattern(Question))
    end

    @testset "Number" begin
        @test startswith("0", pattern(Number))
        @test !startswith("a", pattern(Number))
    end

    @testset "Keywords" begin
        @test startswith("function", pattern(Keyword("function")))
    end
end