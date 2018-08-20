sum(x, y) = x + y

@show sum(1, 1)

@show @code_lowered sum(1, 1)

@show @code_llvm sum(1, 1)

@show @code_native sum(1, 1)

