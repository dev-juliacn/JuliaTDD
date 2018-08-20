using Pkg


Pkg.add("InteractiveUtils")
using InteractiveUtils

versioninfo()

using JuliaTDD
JuliaTDD.greet()

println("The test works.")
println("Let's do something useful.")

include("pycall.jl")
include("pip.jl")
