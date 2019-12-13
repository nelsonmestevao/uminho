%% fminunc %%
optimset fminunc

%%
op = optimset('gradobj', 'on') % para usar o gradiente, temos de fornecer as derivadas

%%
op = optimset('hessupdate', 'dfp') % por defeito é bfgs

% ----------------------------------------------------------------------- %


%% fminsearch %%
optimset fminsearch

%%
op = optimset('display', 'iter', 'TolX', 1e-20, 'MaxFunEvals', 10000, 'MaxIter', 10000)

%%
op = optimset('display', 'iter') % para se ver as iterações

% ----------------------------------------------------------------------- %


%%
clear all
clc