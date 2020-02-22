/* What is each pokemon's primary type? */
select pkm.name as name, t.name as primary_type
from pokemon.pokemons pkm
left outer join pokemon.types t
on pkm.primary_type = t.id;


/* What is Rufflet's secondary type? */
select pkm.name, pkm.secondary_type
from pokemon.pokemons pkm
where pkm.name = "Rufflet";

select pkm.name as pokemon_name, t.name as secondary_type
from pokemon.pokemons pkm join pokemon.types t
on pkm.secondary_type = t.id
where pkm.name = "Rufflet";

/* What are the names of the pokemon that belong to the trainer with trainerID 303? */
/* How many pokemon have a secondary type Poison */
/* What are all the primary types and how many pokemon have that type? */
/* How many pokemon at level 100 does each trainer with at least one level 100 pokemon have? (Hint: your query should not display a trainer) */
/* How many pokemon only belong to one trainer and no other? */