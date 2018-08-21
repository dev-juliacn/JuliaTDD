function act4()
    temp = PyNULL()
    pygymenv = gym.make("CartPole-v0")
    pygymenv[:reset]()
    i = 0
    pycall!(temp, pygymenv[:step], PyVector, pycall(pygymenv[:action_space][:sample], PyObject))
    t = @elapsed while !temp[3]
        i += 1
        pycall!(temp, pygymenv[:step], PyVector, pycall(pygymenv[:action_space][:sample], PyObject))
    end
    t / i
end

ts = [act4() for _ in 1:1000]
@show mean(ts), std(ts)
