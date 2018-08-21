# JuliaTDD

Julia Package for TDD (Test Driven Development)  

The purpose of this package is to offer a reproducible workflow driven by `Pkg.test()` and rapid prototype in REPL.

The basic idea is very simple.

1. Create an empty package with one-line shell command running [generate.jl](generate.jl).

```
julia generate.jl
```

2. Add depenency with [add.jl](add.jl).
```
julia add.jl
```

3. Copy the files and folders from `JuliaTDD` folder to the root (because we want to use this repo as 
an external Julia package that can be added via `Pkg.add()`).

```
cp -r JuliaTDD/src .
cp -r JuliaTDD/*.toml .
```

4. Start REPL with one-line shell command running [main.jl](main.jl).

```
julia -i main.jl
```		

To make it simple to prototype ideas, unlike other production Julia packages, main activities 
in JuliaTDD happen in [test](test) folder, while we leave the [dummy hello world package](src/JuliaTDD.jl) unchanged.

## Usage

1. If you clone this repo, you can run following (see [Makefile](Makefile)).

```
make clean repl-test
```

2. If you are in another REPL, you can add and test this package

```
(v1.0) pkg> add https://github.com/dev-juliacn/JuliaTDD#gym
```
```
(v1.0) pkg> test JuliaTDD
```

3. You can also use following one-liner with docker images [juliacn/ubuntu:julia.pycall](https://hub.docker.com/r/juliacn/ubuntu/tags/) 
```
docker run --rm juliacn/ubuntu:julia.pycall julia -i -e 'using Pkg;Pkg.add(Pkg.PackageSpec(url="https://github.com/dev-juliacn/JuliaTDD", rev="gym"));Pkg.test("JuliaTDD");'
```

```
$ docker run --rm juliacn/ubuntu:julia.pycall julia -i -e 'using Pkg;Pkg.add(Pkg.PackageSpec(url="https://github.com/dev-juliacn/JuliaTDD", rev="gym"));Pkg.test("JuliaTDD");'
  Updating registry at `~/.julia/registries/General`
  Updating git-repo `https://github.com/JuliaRegistries/General.git`
   Cloning git-repo `https://github.com/dev-juliacn/JuliaTDD`
  Updating git-repo `https://github.com/dev-juliacn/JuliaTDD`
 Resolving package versions...
  Updating `~/.julia/environments/v1.0/Project.toml`
  [6c14a3f6] + JuliaTDD v0.1.0 #gym (https://github.com/dev-juliacn/JuliaTDD)
  Updating `~/.julia/environments/v1.0/Manifest.toml`
  [6c14a3f6] + JuliaTDD v0.1.0 #gym (https://github.com/dev-juliacn/JuliaTDD)
   Testing JuliaTDD
    Status `/tmp/tmpl3cTGG/Manifest.toml`
  [34da2185] Compat v1.0.1
  [8f4d0f93] Conda v1.0.1+ #master (https://github.com/JuliaPy/Conda.jl)
  [682c06a0] JSON v0.19.0
  [6c14a3f6] JuliaTDD v0.1.0 #gym (https://github.com/dev-juliacn/JuliaTDD)
  [1914dd2f] MacroTools v0.4.4
  [438e738f] PyCall v1.18.0+ #master (https://github.com/JuliaPy/PyCall.jl)
  [81def892] VersionParsing v1.1.2
  [2a0f44e3] Base64  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Base64`]
  [ade2ca70] Dates  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Dates`]
  [8bb1440f] DelimitedFiles  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/DelimitedFiles`]
  [8ba89e20] Distributed  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Distributed`]
  [b77e0a4c] InteractiveUtils  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/InteractiveUtils`]
  [76f85450] LibGit2  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/LibGit2`]
  [8f399da3] Libdl  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Libdl`]
  [37e2e46d] LinearAlgebra  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/LinearAlgebra`]
  [56ddb016] Logging  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Logging`]
  [d6f4376e] Markdown  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Markdown`]
  [a63ad114] Mmap  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Mmap`]
  [44cfe95a] Pkg  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Pkg`]
  [de0858da] Printf  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Printf`]
  [3fa0cd96] REPL  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/REPL`]
  [9a3f8284] Random  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Random`]
  [ea8e919c] SHA  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/SHA`]
  [9e88b42a] Serialization  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Serialization`]
  [1a1011a3] SharedArrays  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/SharedArrays`]
  [6462fe0b] Sockets  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Sockets`]
  [2f01184e] SparseArrays  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/SparseArrays`]
  [10745b16] Statistics  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Statistics`]
  [8dfed614] Test  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Test`]
  [cf7118a7] UUIDs  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/UUIDs`]
  [4ec0a83e] Unicode  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Unicode`]
  Updating registry at `~/.julia/registries/General`
  Updating git-repo `https://github.com/JuliaRegistries/General.git`
 Resolving package versions...
  Updating `/tmp/tmpl3cTGG/Project.toml`
 [no changes]
  Updating `/tmp/tmpl3cTGG/Manifest.toml`
 [no changes]
Julia Version 1.0.0
Commit 5d4eaca0c9 (2018-08-08 20:58 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
  CPU: Intel(R) Core(TM) i7-4770HQ CPU @ 2.20GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-6.0.0 (ORCJIT, haswell)
Environment:
  JULIA_PATH = /usr/local/julia
  JULIA_GPG = 3673DF529D9049477F76B37566E3C7DC03D6E495
  JULIA_VERSION = 1.0.0
  JULIA_LOAD_PATH = @:/tmp/tmpl3cTGG
Hello World!The test works.
Let's do something useful.
   Testing PyCall
 Resolving package versions...
    Status `/tmp/tmpOU4lAN/Manifest.toml`
  [34da2185] Compat v1.0.1
  [8f4d0f93] Conda v1.0.1+ #master (https://github.com/JuliaPy/Conda.jl)
  [682c06a0] JSON v0.19.0
  [1914dd2f] MacroTools v0.4.4
  [438e738f] PyCall v1.18.0+ #master (https://github.com/JuliaPy/PyCall.jl)
  [81def892] VersionParsing v1.1.2
  [2a0f44e3] Base64  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Base64`]
  [ade2ca70] Dates  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Dates`]
  [8bb1440f] DelimitedFiles  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/DelimitedFiles`]
  [8ba89e20] Distributed  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Distributed`]
  [b77e0a4c] InteractiveUtils  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/InteractiveUtils`]
  [76f85450] LibGit2  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/LibGit2`]
  [8f399da3] Libdl  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Libdl`]
  [37e2e46d] LinearAlgebra  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/LinearAlgebra`]
  [56ddb016] Logging  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Logging`]
  [d6f4376e] Markdown  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Markdown`]
  [a63ad114] Mmap  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Mmap`]
  [44cfe95a] Pkg  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Pkg`]
  [de0858da] Printf  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Printf`]
  [3fa0cd96] REPL  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/REPL`]
  [9a3f8284] Random  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Random`]
  [ea8e919c] SHA  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/SHA`]
  [9e88b42a] Serialization  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Serialization`]
  [1a1011a3] SharedArrays  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/SharedArrays`]
  [6462fe0b] Sockets  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Sockets`]
  [2f01184e] SparseArrays  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/SparseArrays`]
  [10745b16] Statistics  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Statistics`]
  [8dfed614] Test  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Test`]
  [cf7118a7] UUIDs  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/UUIDs`]
  [4ec0a83e] Unicode  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Unicode`]
┌ Info: Python version 3.6.5 from /root/.julia/packages/Conda/m7vem/deps/usr/lib/libpython3.6m, PYTHONHOME=/root/.julia/packages/Conda/m7vem/deps/usr:/root/.julia/packages/Conda/m7vem/deps/usr
│ ENV[PYTHONPATH]=
│ ENV[PYTHONHOME]=
└ ENV[PYTHONEXECUTABLE]=
[ Info: Installing zmq via the Conda pyzmq package...
[ Info: Running `conda install -y pyzmq` in root environment
Solving environment: ...working... done
libsodium-1.0.16     | 302 KB    | ########## | 100% 
pyzmq-17.1.2         | 454 KB    | ########## | 100% 
zeromq-4.2.5         | 567 KB    | ########## | 100% 
## Package Plan ##

  environment location: /root/.julia/packages/Conda/m7vem/deps/usr

  added / updated specs: 
    - pyzmq


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    libsodium-1.0.16           |       h1bed415_0         302 KB
    pyzmq-17.1.2               |   py36h14c3975_0         454 KB
    zeromq-4.2.5               |       hf484d3e_0         567 KB
    ------------------------------------------------------------
                                           Total:         1.3 MB

The following NEW packages will be INSTALLED:

    libsodium: 1.0.16-h1bed415_0    
    pyzmq:     17.1.2-py36h14c3975_0
    zeromq:    4.2.5-hf484d3e_0     


Downloading and Extracting Packages
Preparing transaction: ...working... done
Verifying transaction: ...working... done
Executing transaction: ...working... done

[ Info: Running `conda remove -y pyzmq` in root environment
Solving environment: ...working... done

## Package Plan ##

  environment location: /root/.julia/packages/Conda/m7vem/deps/usr

  removed specs: 
    - pyzmq


The following packages will be REMOVED:

    pyzmq: 17.1.2-py36h14c3975_0

Preparing transaction: ...working... done
Verifying transaction: ...working... done
Executing transaction: ...working... done
Test Summary: | Pass  Total
PyCall        |  429    429
Test Summary: | Pass  Total
pydef         |    6      6
Test Summary: | Pass  Total
pycall!       |   16     16
   Testing PyCall tests passed 
Requirement already satisfied: cython in /root/.julia/packages/Conda/m7vem/deps/usr/lib/python3.6/site-packages (0.28.5)
Requirement already up-to-date: pip in /root/.julia/packages/Conda/m7vem/deps/usr/lib/python3.6/site-packages (18.0)
Collecting gym
  Downloading https://files.pythonhosted.org/packages/9b/50/ed4a03d2be47ffd043be2ee514f329ce45d98a30fe2d1b9c61dea5a9d861/gym-0.10.5.tar.gz (1.5MB)
Requirement already satisfied: numpy>=1.10.4 in /root/.julia/packages/Conda/m7vem/deps/usr/lib/python3.6/site-packages (from gym) (1.15.0)
Requirement already satisfied: requests>=2.0 in /root/.julia/packages/Conda/m7vem/deps/usr/lib/python3.6/site-packages (from gym) (2.18.4)
Requirement already satisfied: six in /root/.julia/packages/Conda/m7vem/deps/usr/lib/python3.6/site-packages (from gym) (1.11.0)
Collecting pyglet>=1.2.0 (from gym)
  Downloading https://files.pythonhosted.org/packages/1c/fc/dad5eaaab68f0c21e2f906a94ddb98175662cc5a654eee404d59554ce0fa/pyglet-1.3.2-py2.py3-none-any.whl (1.0MB)
Requirement already satisfied: chardet<3.1.0,>=3.0.2 in /root/.julia/packages/Conda/m7vem/deps/usr/lib/python3.6/site-packages (from requests>=2.0->gym) (3.0.4)
Requirement already satisfied: idna<2.7,>=2.5 in /root/.julia/packages/Conda/m7vem/deps/usr/lib/python3.6/site-packages (from requests>=2.0->gym) (2.6)
Requirement already satisfied: urllib3<1.23,>=1.21.1 in /root/.julia/packages/Conda/m7vem/deps/usr/lib/python3.6/site-packages (from requests>=2.0->gym) (1.22)
Requirement already satisfied: certifi>=2017.4.17 in /root/.julia/packages/Conda/m7vem/deps/usr/lib/python3.6/site-packages (from requests>=2.0->gym) (2018.8.13)
Collecting future (from pyglet>=1.2.0->gym)
  Downloading https://files.pythonhosted.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz (824kB)
Building wheels for collected packages: gym, future
  Running setup.py bdist_wheel for gym: started
  Running setup.py bdist_wheel for gym: finished with status 'done'
  Stored in directory: /root/.cache/pip/wheels/cb/14/71/f4ab006b1e6ff75c2b54985c2f98d0644fffe9c1dddc670925
  Running setup.py bdist_wheel for future: started
  Running setup.py bdist_wheel for future: finished with status 'done'
  Stored in directory: /root/.cache/pip/wheels/bf/c9/a3/c538d90ef17cf7823fa51fc701a7a7a910a80f6a405bf15b1a
Successfully built gym future
Installing collected packages: future, pyglet, gym
Successfully installed future-0.16.0 gym-0.10.5 pyglet-1.3.2
Package      Version  
------------ ---------
asn1crypto   0.24.0   
certifi      2018.8.13
cffi         1.11.5   
chardet      3.0.4    
conda        4.5.10   
cryptography 2.2.2    
Cython       0.28.5   
future       0.16.0   
gym          0.10.5   
idna         2.6      
mkl-fft      1.0.4    
mkl-random   1.0.1    
numpy        1.15.0   
pip          18.0     
pycosat      0.6.3    
pycparser    2.18     
pyglet       1.3.2    
pyOpenSSL    18.0.0   
PySocks      1.6.8    
requests     2.18.4   
ruamel-yaml  0.15.37  
setuptools   39.2.0   
six          1.11.0   
urllib3      1.22     
wheel        0.31.1   
WARN: gym.spaces.Box autodetected dtype as <class 'numpy.float32'>. Please provide explicit dtype.
...
WARN: gym.spaces.Box autodetected dtype as <class 'numpy.float32'>. Please provide explicit dtype.(mean(ts), std(ts)) = (2.6180459797514936e-5, 7.916634389288836e-6)
   Testing JuliaTDD tests passed 

```
