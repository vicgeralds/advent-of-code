#!/bin/bash

input=$(sed 's/Button \([AB]\): X[+]\([0-9]*\), Y[+]/button_\1_x=\2;button_\1_y=/;s/Prize: X=\([0-9]*\), Y=/prize_x=\1;prize_y=/' day13-input.txt|tr A-Z a-z)

claw_machine_data=""
total_tokens=0
for line in $input; do
    claw_machine_data="${claw_machine_data}${line};"
    if [[ "$line" == prize* ]]; then
        eval "$claw_machine_data"
        (( prize_x += 10000000000000 ))
        (( prize_y += 10000000000000 ))
        a1=$((button_b_y * prize_x - button_b_x * prize_y))
        a2=$((button_b_y * button_a_x - button_b_x * button_a_y))
        b1=$((button_a_x * prize_y - button_a_y * prize_x))
        b2=$((button_a_x * button_b_y - button_a_y * button_b_x))

        if (( a1 % a2 == 0 )) && (( b1 % b2 == 0)); then
            a=$((a1 / a2))
            b=$((b1 / b2))
            if (( a >= 0 )) && (( b >= 0 )); then
                (( total_tokens += 3*a + b ))
            fi
        fi
        #output=$(minizinc --solver cbc day13.mzn -D "$claw_machine_data")
        output=""
        if [[ "$output" == *tokens:* ]]; then
            for tokens in ${output#*tokens:}; do
                echo "adding tokens: $tokens"
                (( total_tokens += $tokens ))
                break
            done
        fi
        claw_machine_data=""
    fi
done

echo What is the fewest tokens you would have to spend to win all possible prizes?
echo $total_tokens
