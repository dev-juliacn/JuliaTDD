function act3()
    temp = PyNULL()
    pygymenv = gym.make("CartPole-v0")
    pygymenv[:reset]()
    i = 0
    state, reward, done, info = pygymenv[:step](pygymenv[:action_space][:sample]())
    t = @elapsed while !done
        i += 1
        pycall!(temp, pygymenv[:step], PyVector, pycall(pygymenv[:action_space][:sample], PyObject))
        state, reward, done, info = temp
    end
    t / i
end

ts = [act3() for _ in 1:1000]
@show mean(ts), std(ts)

