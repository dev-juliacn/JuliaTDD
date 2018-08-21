function act2()
    pygymenv = gym.make("CartPole-v0")
    pygymenv[:reset]()
    i = 0
    state, reward, done, info = pygymenv[:step](pygymenv[:action_space][:sample]())
    t = @elapsed while !done
        i += 1
        state, reward, done, info = pycall(pygymenv[:step], PyVector, pycall(pygymenv[:action_space][:sample], PyObject))
    end
    t / i
end

ts = [act2() for _ in 1:1000]
@show mean(ts), std(ts)
