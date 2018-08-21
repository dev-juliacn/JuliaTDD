function act1()
    pygymenv = gym.make("CartPole-v0")
    pygymenv[:reset]()
    i = 0
    state, reward, done, info = pygymenv[:step](pygymenv[:action_space][:sample]())
    t = @elapsed while !done
        i += 1
        state, reward, done, info = pygymenv[:step](pygymenv[:action_space][:sample]())
    end
    t / i
end

ts = [act1() for _ in 1:1000]
@show mean(ts), std(ts)
