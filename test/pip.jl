using Conda
path = Conda.ROOTENV
run(`$path/bin/pip install cython`)
run(`$path/bin/pip install --upgrade pip`)
run(`$path/bin/pip install gym`)
run(`$path/bin/pip list`)
