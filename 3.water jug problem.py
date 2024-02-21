from collections import deque

def is_valid_state(state, jug1_capacity, jug2_capacity):
    jug1, jug2 = state
    return jug1 >= 0 and jug2 >= 0 and jug1 <= jug1_capacity and jug2 <= jug2_capacity

def is_goal_state(state, goal_amount):
    return state[0] == goal_amount

def get_next_states(state, jug1_capacity, jug2_capacity):
    jug1, jug2 = state
    next_states = []
    
    next_states.append((jug1_capacity, jug2))
    
    next_states.append((jug1, jug2_capacity))
    
    next_states.append((0, jug2))
    
    next_states.append((jug1, 0))
    
    pour_amount = min(jug1, jug2_capacity - jug2)
    next_states.append((jug1 - pour_amount, jug2 + pour_amount))
    
    pour_amount = min(jug2, jug1_capacity - jug1)
    next_states.append((jug1 + pour_amount, jug2 - pour_amount))
    
    return next_states

def solve_water_jug_problem(jug1_capacity, jug2_capacity, goal_amount):
    start_state = (0, 0)
    visited = set()
    queue = deque([(start_state, [])])
    
    while queue:
        current_state, path = queue.popleft()
        if current_state in visited:
            continue
        
        visited.add(current_state)
        if is_goal_state(current_state, goal_amount):
            return path
        
        next_states = get_next_states(current_state, jug1_capacity, jug2_capacity)
        for next_state in next_states:
            if is_valid_state(next_state, jug1_capacity, jug2_capacity) and next_state not in visited:
                queue.append((next_state, path + [next_state]))
    
    return None

jug1_capacity = int(input("Enter the capacity of the first jug: "))
jug2_capacity = int(input("Enter the capacity of the second jug: "))
goal_amount = int(input("Enter the goal amount of water: "))

solution = solve_water_jug_problem(jug1_capacity, jug2_capacity, goal_amount)

if solution:
    print("Solution Steps:")
    for step in solution:
        print(step)
else:
    print("No solution found.")
