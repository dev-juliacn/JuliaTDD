batch-test: JuliaTDD
	docker-compose run --rm work julia -e 'using Pkg;Pkg.activate(".");Pkg.update();Pkg.test()'

repl-test:	JuliaTDD
	docker-compose run --rm work julia -i -e 'using Pkg;Pkg.activate(".");Pkg.update();Pkg.test()'

bash:
	docker-compose run --rm work bash

JuliaTDD:
	docker-compose run --rm work julia -e 'using Pkg; Pkg.generate("JuliaTDD")'
	docker-compose run --rm work julia -e 'using Pkg; Pkg.activate("JuliaTDD");Pkg.add("InteractiveUtils")'
	cp -r JuliaTDD/src .
	cp -r JuliaTDD/*.toml .

clean:
	rm -rf JuliaTDD
