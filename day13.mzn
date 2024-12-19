
int: button_a_x;
int: button_a_y;
int: button_b_x;
int: button_b_y;
int: prize_x;
int: prize_y;

var 0..100: a;
var 0..100: b;

constraint button_a_x*a + button_b_x*b = prize_x;
constraint button_a_y*a + button_b_y*b = prize_y;

solve minimize 3*a + b;

output ["tokens: \(3*a + b)\n"];
