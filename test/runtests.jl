using InteractiveUtils
versioninfo()

using JuliaTDD
JuliaTDD.greet()

println("The test works.")
println("Let's do something useful.")
@time 1 + 1

include("sum.jl")
