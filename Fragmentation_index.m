%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
% Fragmentation Index
%
% This code computes a fragmentation index for the states of sleep and
% wakefulness. Paper published in bioRxiv doi:123345-2. The basic idea is
% to model the sleep states as a markov chain, and then find the
% conditional probabilities of the transitions. Then the fragmentation
% index is defined as the 1 - P(X/X), that is, the probability of
% transitioning from state X to state X in the next epoch. Taking into an
% account that P(X/X)+P(~X/X) = 1. 
%
% Joaquin Gonzalez, Laboratorio de Neurobiologia del Sueno, Facultad de 
% Medicina, Universidad de la Republica, Uruguay. 2020
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [state_prob,fragmentation_index] = Fragmentation_index(scoring,state)

    State = find(scoring == state); % find state within the scoring
    state_prob = length(State)/length(scoring); % find state probability
    State = State(1:end-1); % get rid of the last transition 
    self_transitions = length(find(scoring(State+1)==state)); % find number of transitions to the same state
    other_transitions = length(find(scoring(State+1)~=state)); % find number of transitions to other states
    p_self_transition = self_transitions/(self_transitions+other_transitions); % get the probability of transitioning to the same state
    fragmentation_index = 1 - p_self_transition; % compute FI as 1 - p_self_transition
    
end










