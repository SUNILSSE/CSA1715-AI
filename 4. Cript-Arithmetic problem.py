from itertools import permutations

def solve_cryptarithmetic(puzzle):
    words = puzzle.upper().split()
    unique_chars = set(''.join(words))
    if len(unique_chars) > 10:
        print("Invalid input: More than 10 unique characters.")
        return None

    first_letters = set(word[0] for word in words)
    if len(words[-1]) > len(words[0]):
        first_letters.add(words[-1][0])

    for p in permutations('0123456789', len(unique_chars)):
        if '0' in p[len(unique_chars) - len(first_letters):len(unique_chars)]:
            continue
        mapping = {ch: d for ch, d in zip(unique_chars, p)}
        if all(int(''.join(mapping[ch] for ch in word)) for word in words):
            return {ch: int(d) for ch, d in mapping.items()}

    print("No solution found.")
    return None

puzzle = "BASE+BALL=GAMES"
solution = solve_cryptarithmetic(puzzle)
if solution:
   print("Solution found:")
for ch, d in solution.items():
        print(ch,"=",d)
