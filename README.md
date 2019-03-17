# BasicCheck-BASH
This is a short script in BASH that helps to debug and find memory leaks

in this script we are using valgring and helgrind to check if there is any memory leaks in c++ projects.

the script will return a number between 0 to 7 that indicates what fails and what pass with binary form.
0 = PASS.
1 = FAIL.

the first bit checking for compilation, then memory leaks and the last bit for thread race.

for exaple: 011 = compilation pass, memory and thread fails.

Names: Yotam Dafna, Tomer hazan
