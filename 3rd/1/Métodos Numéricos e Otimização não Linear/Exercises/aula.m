%% 1
%
optimset fminunc
op = optimset('gradobj', 'on'); % para usar o gradiente
[x,f,exitflag,output]=fminunc(@aluffi,[-1;0.5],op)

%% 2
%

%%

clc
clear all