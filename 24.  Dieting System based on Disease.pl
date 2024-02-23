% Facts: Define the relationship between diseases and diets
disease(diabetes, low_carb_diet).
disease(hypertension, low_salt_diet).
disease(heart_disease, low_fat_diet).
disease(gout, low_purine_diet).

% Rule: Suggest a diet based on the disease
suggest_diet(Disease, Diet) :-
    disease(Disease, Diet).

% Example queries:
% ?- suggest_diet(diabetes, Diet).
% ?- suggest_diet(heart_disease, Diet).
% ... (similar queries for other diseases)
