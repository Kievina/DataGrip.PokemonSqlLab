use pokemon;

/* What is each pokemon's primary type? */
select pkm.name as pokemon_name, t.name as primary_type
from pokemons pkm
left join types t
on pkm.primary_type = t.id;

/* What is Rufflet's secondary type? */
select pkm.name as pokemon_name, t.name as secondary_type
from pokemon.pokemons pkm
left join pokemon.types t
on pkm.secondary_type = t.id
where pkm.name = 'Rufflet';

/* What are the names of the pokemon that belong to the trainer with trainerID 303? */
select distinct pkm.name as pokemon_name
from pokemon_trainer as train
join pokemons as pkm
on train.pokemon_id = pkm.id
where train.trainerID = 303;

/* How many pokemon have a secondary type Poison */
select count(t.name) as n_type_poison
from pokemons pkm
left join types t
on pkm.secondary_type = t.id
where t.name = 'Poison';

/* What are all the primary types and how many pokemon have that type? */
select t.name as primary_name, count(pkm.primary_type) as n_primary
from pokemons pkm
join types t
on pkm.primary_type = t.id
group by t.name;

/* How many pokemon at level 100 does each trainer with at least one level 100 pokemon have? (Hint: your query should not display a trainer) */
select pkm_train.trainerID, count(pkm_train.pokelevel) as n_pokemon
from trainers as train
inner join pokemon_trainer as pkm_train
on train.trainerID = pkm_train.trainerID
where pkm_train.pokelevel = 100
group by pkm_train.trainerID
having n_pokemon >= 1;

# Without join statement
select trainerID, count(*) as n_pokemon
from pokemon_trainer
where pokelevel = 100 group by trainerID;

/* How many pokemon only belong to one trainer and no other? */
# select pkm.id as pokemon_id, count(train.trainerID) as n_trainers
# from pokemon.pokemons as pkm
# left join pokemon.pokemon_trainer as train
# on pkm.id = train.pokemon_id
# group by pkm.id;

select count(*) as n_pokemon
from (
    select train.pokemon_id, count(train.trainerID)
    from pokemon_trainer as train
    group by train.pokemon_id
    having count(trainerID) = 1
    ) as shortlist;