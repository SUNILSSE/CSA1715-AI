% Knowledge Base
symptom(fever, malaria).
symptom(rash, measles).
symptom(headache, stress).
symptom(headache, meningitis).
symptom(sore_throat, cold).
symptom(sore_throat, flu).
symptom(cough, cold).
symptom(cough, flu).

% Rules
diagnose(Disease, Symptoms) :-
    symptom(Symptom, Disease),
    member(Symptom, Symptoms).

% Example Query
% diagnose(Disease, [symptom1, symptom2, ..., symptomN]).

% Example usage:
?- diagnose(Disease, [fever, cough]).
