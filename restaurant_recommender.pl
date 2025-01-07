% Dish Facts
% dish(Name, ContainsPepper, Price, ProteinContent, MealType, CulturalSignificance)
dish(doro_wot, yes, 15, high, lunch, yes).    % Spicy chicken stew
dish(tibs, no, 12, high, lunch, yes).         % Sautéed meat dish
dish(kitfo, yes, 10, high, lunch, yes).       % Minced raw beef
dish(ater_kik, no, 7, medium, lunch, yes).    % Split pea stew
dish(chechebsa, no, 6, medium, breakfast, yes). % Spiced flatbread
dish(genfo, no, 5, medium, breakfast, yes).   % Barley porridge
dish(shiro, no, 8, low, lunch, yes).          % Chickpea stew
dish(beyaynetu, no, 10, medium, lunch, yes).  % Vegetarian platter
dish(injera, no, 4, low, breakfast, yes).     % Ethiopian flatbread
dish(kinche, no, 6, medium, breakfast, yes).  % Cracked wheat porridge
dish(dabo_kolo, no, 3, low, snack, yes).      % Crunchy roasted grains
dish(tilapia_fish, no, 12, medium, lunch, yes). % Fried or grilled fish
dish(pasta, no, 10, high, lunch, no).         % Pasta dish
dish(burger, yes, 8, medium, lunch, no).      % Burger
dish(salad, no, 5, low, lunch, no).           % Salad
dish(steak, no, 20, high, dinner, yes).       % Steak
dish(fish_tacos, yes, 12, medium, lunch, yes).% Fish tacos
dish(omelette, no, 7, medium, breakfast, no). % Omelette
dish(falafel, no, 6, high, lunch, yes).       % Falafel

% Drink Pairings: drink_pair(Dish, Drink)
drink_pair(doro_wot, tej).         % Honey wine
drink_pair(tibs, beer).
drink_pair(kitfo, wine).
drink_pair(ater_kik, tea).
drink_pair(chechebsa, coffee).
drink_pair(genfo, milk).
drink_pair(shiro, tea).
drink_pair(beyaynetu, juice).
drink_pair(injera, tej).
drink_pair(kinche, coffee).
drink_pair(dabo_kolo, soda).
drink_pair(tilapia_fish, beer).

% 1. Recommend dishes without pepper
recommend_no_pepper(Dish) :-
    dish(Dish, no, _, _, _, _).

% 2. Recommend dishes with the lowest price
recommend_lowest_price(Dish) :-
    findall(Price-Dish, dish(Dish, _, Price, _, _, _), Dishes),
    sort(Dishes, [(_-Dish)|_]).

% 3. Recommend culturally significant dishes
recommend_cultural_dish(Dish) :-
    dish(Dish, _, _, _, _, yes).

% 4. Recommend high-protein dishes
recommend_high_protein(Dish) :-
    dish(Dish, _, _, high, _, _).

% 5. Recommend dishes suitable for a specific meal type
recommend_meal_type(Dish, MealType) :-
    dish(Dish, _, _, _, MealType, _).

% 6. Recommend a drink that pairs well with a selected dish
recommend_drink(Dish, Drink) :-
    drink_pair(Dish, Drink).


% Explanation
% The Prolog program fully meets all the specified criteria:

% Recommends dishes without pepper.
% Recommends the dish with the lowest price.
% Recommends culturally significant dishes.
% Recommends dishes that are high in protein.
% Recommends dishes suitable for lunch or breakfast.
% Recommends drinks that pair well with a selected dish.

% 1. Recommends dishes without pepper.
recommend_no_pepper(Dish) :-
    dish(Dish, no, _, _, _, _).

% Output:
% 2 ?- recommend_no_pepper(Dish).
% Dish = tibs ;
% Dish = ater_kik ;
% Dish = chechebsa ;
% Dish = genfo ;
% Dish = shiro ;
% Dish = beyaynetu ;
% Dish = injera ;
% Dish = kinche ;
% Dish = dabo_kolo ;
% Dish = tilapia_fish ;
% Dish = pasta ;
% Dish = salad ;
% Dish = steak ;
% Dish = omelette ;
% Dish = falafel.

% 2. Recommends the dish with the lowest price.
recommend_lowest_price(Dish) :-
    findall(Price-Dish, dish(Dish, _, Price, _, _, _), Dishes),
    sort(Dishes, [(_-Dish)|_]).

% Output:
% 2 ?- recommend_lowest_price(Dish).
% Dish = dabo_kolo.

% 3. Recommends culturally significant dishes.
recommend_cultural_dish(Dish) :-
    dish(Dish, _, _, _, _, yes).

% Output:
% 2 ?- recommend_cultural_dish(Dish).
% Dish = doro_wot ;
% Dish = tibs ;
% Dish = kitfo ;
% Dish = ater_kik ;
% Dish = chechebsa ;
% Dish = genfo ;
% Dish = shiro ;
% Dish = beyaynetu ;
% Dish = injera ;
% Dish = kinche ;
% Dish = dabo_kolo ;
% Dish = tilapia_fish ;
% Dish = steak ;
% Dish = fish_tacos ;
% Dish = falafel.

% 4. Recommends dishes that are high in protein.
recommend_high_protein(Dish) :-
    dish(Dish, _, _, high, _, _).

% Output:
% 2 ?- recommend_high_protein(Dish).
% Dish = doro_wot ;
% Dish = tibs ;
% Dish = kitfo ;
% Dish = pasta ;
% Dish = steak ;
% Dish = falafel.

% 5. Recommends dishes suitable for lunch or breakfast.
recommend_meal_type(Dish, MealType) :-
    dish(Dish, _, _, _, MealType, _).

% Output for lunch:
% 2 ?- recommend_meal_type(Dish, lunch).
% Dish = doro_wot ;
% Dish = tibs ;
% Dish = kitfo ;
% Dish = ater_kik ;
% Dish = shiro ;
% Dish = beyaynetu ;
% Dish = tilapia_fish ;
% Dish = pasta ;
% Dish = burger ;
% Dish = salad ;
% Dish = fish_tacos ;
% Dish = falafel.

% Output for breakfast:
% 2 ?- recommend_meal_type(Dish, breakfast).
% Dish = chechebsa ;
% Dish = genfo ;
% Dish = injera ;
% Dish = kinche ;
% Dish = omelette.

% 6. Recommends drinks that pair well with a selected dish.
recommend_drink(Dish, Drink) :-
    drink_pair(Dish, Drink).

% Output:
% recommend_drink(Dish, Drink).
% Dish = doro_wot,
% Drink = tej ;
% Dish = tibs,
% Drink = beer ;
% Dish = kitfo,
% Drink = wine ;
% Dish = ater_kik,
% Drink = tea ;
% Dish = chechebsa,
% Drink = coffee ;
% Dish = genfo,
% Drink = milk ;
% Dish = shiro,
% Drink = tea ;
% Dish = beyaynetu,
% Drink = juice ;
% Dish = injera,
% Drink = tej ;
% Dish = kinche,
% Drink = coffee ;
% Dish = dabo_kolo,
% Drink = soda ;
% Dish = tilapia_fish,
% Drink = beer.
