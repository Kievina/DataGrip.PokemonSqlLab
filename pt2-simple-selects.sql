/* What are all the types of pokemon that a pokemon can have? */
select name from pokemon.types;

/* What is the name of the pokemon with id 45? */
select name from pokemon.pokemons pkm
where pkm.id = 45;

select * from pokemon.pokemons pkm
where pkm.id = 45;

/* How many pokemon are there? */
select count(*)
from pokemon.pokemons;

/* How many types are there? */
select count(*)
from pokemon.types;

/* How many pokemon have a secondary type? */
select count(*)
from pokemon.pokemons pkm
where pkm.secondary_type IS NOT NULL;