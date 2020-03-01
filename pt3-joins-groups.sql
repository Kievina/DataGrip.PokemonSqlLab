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
select train.trainerID, pkm.name as pokemon_name
from pokemon.pokemon_trainer as train
join pokemon.pokemons as pkm
on train.pokemon_id = pkm.id
where train.trainerID = 303;

select distinct pkm.name as pokemon_name
from pokemon.pokemon_trainer as train
join pokemon.pokemons as pkm
on train.pokemon_id = pkm.id
where train.trainerID = 303;

/* How many pokemon have a secondary type Poison */
select pkm.secondary_type
from pokemon.pokemons pkm
left join pokemon.types t
on pkm.secondary_type = t.id
where t.name = "Poison";

select count(t.name)
from pokemon.pokemons pkm
left join pokemon.types t
on pkm.secondary_type = t.id
where t.name = "Poison";

/* What are all the primary types and how many pokemon have that type? */
select t.name as primary_name, count(pkm.primary_type) as n_primary
from pokemon.pokemons pkm
join pokemon.types t
on pkm.primary_type = t.id
group by pkm.primary_type;

/* How many pokemon at level 100 does each trainer with at least one level 100 pokemon have? (Hint: your query should not display a trainer) */



/* How many pokemon only belong to one trainer and no other? */
# select train.pokemon_id, count(train.trainerID)
# from pokemon.pokemon_trainer train
# group by train.pokemon_id
# having count(trainerID) = 1;