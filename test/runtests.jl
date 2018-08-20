using InteractiveUtils
versioninfo()

using JuliaTDD
JuliaTDD.greet()

println("The test works.")
println("Let's do something useful.")
@time 1 + 1

@code_lowered 1 + 1

@code_llvm 1 + 1

@code_native 1 + 1

