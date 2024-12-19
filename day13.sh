#!/bin/bash

input=$(sed 's/Button \([AB]\): X[+]\([0-9]*\), Y[+]/button_\1_x=\2;button_\1_y=/;s/Prize: X=\([0-9]*\), Y=/prize_x=\1;prize_y=/' day13-input.txt|tr A-Z a-z)

claw_machine_data=""
total_tokens=0
for line in $input; do
    claw_machine_data="${claw_machine_data}${line};"
    if [[ "$line" == prize* ]]; then
        output=$(minizinc --solver cbc day13.mzn -D "$claw_machine_data")
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
