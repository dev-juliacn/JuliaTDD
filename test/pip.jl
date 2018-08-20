Pkg.add("Conda")
using Conda
path = Conda.ROOTENV
run(`$path/bin/pip install --upgrade pip`)
run(`$path/bin/pip list`)
