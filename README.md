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
(v1.0) pkg> add https://github.com/dev-juliacn/JuliaTDD#pycall
```
```
(v1.0) pkg> test JuliaTDD
```

3. You can also use following one-liner with docker images [juliacn/ubuntu:julia.pycall](https://hub.docker.com/r/juliacn/ubuntu/tags/) 
```
docker run --rm juliacn/ubuntu:julia.pycall julia -i -e 'using Pkg;Pkg.add(Pkg.PackageSpec(url="https://github.com/dev-juliacn/JuliaTDD", rev="pycall"));Pkg.test("JuliaTDD");'
```

```
$ docker run --rm juliacn/ubuntu:julia.pycall julia -i -e 'using Pkg;Pkg.add(Pkg.PackageSpec(url="https://github.com/dev-juliacn/JuliaTDD", rev="pycall"));Pkg.test("JuliaTDD");'
  Updating registry at `~/.julia/registries/General`
  Updating git-repo `https://github.com/JuliaRegistries/General.git`
   Cloning git-repo `https://github.com/dev-juliacn/JuliaTDD`
  Updating git-repo `https://github.com/dev-juliacn/JuliaTDD`
 Resolving package versions...
  Updating `~/.julia/environments/v1.0/Project.toml`
  [e55cd0c0] + JuliaTDD v0.1.0 #pycall (https://github.com/dev-juliacn/JuliaTDD)
  Updating `~/.julia/environments/v1.0/Manifest.toml`
  [e55cd0c0] + JuliaTDD v0.1.0 #pycall (https://github.com/dev-juliacn/JuliaTDD)
   Testing JuliaTDD
    Status `/tmp/tmpqTyyXe/Manifest.toml`
  [34da2185] Compat v1.0.1
  [8f4d0f93] Conda v1.0.1+ #master (https://github.com/JuliaPy/Conda.jl)
  [682c06a0] JSON v0.19.0
  [e55cd0c0] JuliaTDD v0.1.0 #pycall (https://github.com/dev-juliacn/JuliaTDD)
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
  Updating `/tmp/tmpqTyyXe/Project.toml`
 [no changes]
  Updating `/tmp/tmpqTyyXe/Manifest.toml`
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
  JULIA_LOAD_PATH = @:/tmp/tmpqTyyXe
Hello World!The test works.
Let's do something useful.
   Testing PyCall
 Resolving package versions...
    Status `/tmp/tmpL14YcB/Manifest.toml`
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
pyzmq-17.1.2         | 454 KB    | ########## | 100% 
libsodium-1.0.16     | 302 KB    | ########## | 100% 
zeromq-4.2.5         | 567 KB    | ########## | 100% 
## Package Plan ##

  environment location: /root/.julia/packages/Conda/m7vem/deps/usr

  added / updated specs: 
    - pyzmq


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    pyzmq-17.1.2               |   py36h14c3975_0         454 KB
    libsodium-1.0.16           |       h1bed415_0         302 KB
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
 Resolving package versions...
  Updating `/tmp/tmpqTyyXe/Project.toml`
 [no changes]
  Updating `/tmp/tmpqTyyXe/Manifest.toml`
 [no changes]
[ Info: Running `conda list` in root environment
# packages in environment at /root/.julia/packages/Conda/m7vem/deps/usr:
#
# Name                    Version                   Build  Channel
asn1crypto                0.24.0                   py36_0  
blas                      1.0                         mkl  
ca-certificates           2018.03.07                    0  
certifi                   2018.8.13                py36_0  
cffi                      1.11.5           py36h9745a5d_0  
chardet                   3.0.4            py36h0f667ec_1  
conda                     4.5.10                   py36_0  
conda-env                 2.6.0                h36134e3_1  
cryptography              2.2.2            py36h14c3975_0  
Cython                    0.28.5                    <pip>
idna                      2.6              py36h82fb2a8_1  
intel-openmp              2018.0.3                      0  
libedit                   3.1.20170329         h6b74fdf_2  
libffi                    3.2.1                hd88cf55_4  
libgcc-ng                 7.2.0                hdf63c60_3  
libgfortran-ng            7.3.0                hdf63c60_0  
libsodium                 1.0.16               h1bed415_0  
libstdcxx-ng              7.2.0                hdf63c60_3  
mkl                       2018.0.3                      1  
mkl_fft                   1.0.4            py36h4414c95_1  
mkl_random                1.0.1            py36h4414c95_1  
ncurses                   6.1                  hf484d3e_0  
numpy                     1.15.0           py36h1b885b7_0  
numpy-base                1.15.0           py36h3dfced4_0  
openssl                   1.0.2p               h14c3975_0  
pip                       18.0                      <pip>
pip                       10.0.1                   py36_0  
pycosat                   0.6.3            py36h0a5515d_0  
pycparser                 2.18             py36hf9f622e_1  
pyopenssl                 18.0.0                   py36_0  
pysocks                   1.6.8                    py36_0  
python                    3.6.5                hc3d631a_2  
readline                  7.0                  ha6073c6_4  
requests                  2.18.4           py36he2e5f8d_1  
ruamel_yaml               0.15.37          py36h14c3975_2  
setuptools                39.2.0                   py36_0  
six                       1.11.0           py36h372c433_1  
sqlite                    3.23.1               he433501_0  
tk                        8.6.7                hc745277_3  
urllib3                   1.22             py36hbe7ace6_0  
wheel                     0.31.1                   py36_0  
xz                        5.2.4                h14c3975_4  
yaml                      0.1.7                had09818_2  
zeromq                    4.2.5                hf484d3e_0  
zlib                      1.2.11               ha838bed_2  
Requirement already satisfied: cython in /root/.julia/packages/Conda/m7vem/deps/usr/lib/python3.6/site-packages (0.28.5)
Requirement already up-to-date: pip in /root/.julia/packages/Conda/m7vem/deps/usr/lib/python3.6/site-packages (18.0)
Package      Version  
------------ ---------
asn1crypto   0.24.0   
certifi      2018.8.13
cffi         1.11.5   
chardet      3.0.4    
conda        4.5.10   
cryptography 2.2.2    
Cython       0.28.5   
idna         2.6      
mkl-fft      1.0.4    
mkl-random   1.0.1    
numpy        1.15.0   
pip          18.0     
pycosat      0.6.3    
pycparser    2.18     
pyOpenSSL    18.0.0   
PySocks      1.6.8    
requests     2.18.4   
ruamel-yaml  0.15.37  
setuptools   39.2.0   
six          1.11.0   
urllib3      1.22     
wheel        0.31.1   
   Testing JuliaTDD tests passed
```
