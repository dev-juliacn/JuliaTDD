batch-test: JuliaTDD
	docker-compose run --rm work julia main.jl

repl-test:  JuliaTDD
	docker-compose run --rm work julia -i main.jl

bash:
	docker-compose run --rm work bash

JuliaTDD:
	docker-compose run --rm work julia generate.jl
	docker-compose run --rm work julia add.jl
	cp -r JuliaTDD/src .
	cp -r JuliaTDD/*.toml .

build:
	docker-compose build

clean:
	rm -rf JuliaTDD
