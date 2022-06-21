#!/bin/bash

if [ "$#" -ne 1 ]; then
    printf "Please provide path to user executable.\n"
	exit
fi
printf "\n============= Error detection ===========\n"

printf "Too many <- expected: Error\n"
./$1 "4 2 2 1 1 2 3 3 4 2 2 1 1 2 3 3 4"

printf "\nNot enough <- expected: Error\n"
./$1 "4 2 2 1 1 2 3 3 4 2 2 1 1 2 3"

printf "\nImpossible <- expected: Error\n"
./$1 "4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4"

printf "\nInvalid character <- expected: Error\n"
./$1 "4 2 2 1 1 A 3 3 4 2 2 1 1 2 3 3"

printf "\nNumber too high <- expected: Error\n"
./$1 "4 2 2 1 1 5 3 3 4 2 2 1 1 2 3 3"

printf "\nNumber too low <- expected: Error\n"
./$1 "4 2 2 1 1 0 3 3 4 2 2 1 1 2 3 3"

printf "\nNumber 42 <- expected: Error\n"
./$1 "4 2 2 1 1 42 3 3 4 2 2 1 1 2 3 3"

printf "\nToo many spaces <- expected: Error\n"
./$1 "4 2 2 1   1 2 3 3 4 2 2 1 1 2 3"

printf "\n=============== Solving ==================\n\n"

echo "From the Subject - 4 3 2 1 - 1 2 2 2 - 4 3 2 1 - 1 2 2 2 | cat -e"
echo "----------------------------------"
./$1 "4 3 2 1 1 2 2 2 4 3 2 1 1 2 2 2" | cat -e
printf "%s\n\n" "----------------------------------"

echo "Level 1 -    up   -   down  -   left  -  right"
echo "Level 1 - 4 2 2 1 - 1 2 3 3 - 4 2 2 1 - 1 2 3 3"
echo "----------------------------------"
./$1 "4 2 2 1 1 2 3 3 4 2 2 1 1 2 3 3"
printf "%s\n\n" "----------------------------------"

echo "Level 2 -    up   -   down  -   left  -  right"
echo "Level 2 - 3 2 2 1 - 2 2 1 3 - 4 2 1 3 - 1 2 2 2"
echo "----------------------------------"
./$1 "3 2 2 1 2 2 1 3 4 2 1 3 1 2 2 2"
printf "%s\n\n" "----------------------------------"

echo "Level 3 -    up   -   down  -   left  -  right"
echo "Level 3 - 3 2 1 2 - 1 2 3 2 - 2 2 2 1 - 2 3 1 4"
echo "----------------------------------"
./$1 "3 2 1 2 1 2 3 2 2 2 2 1 2 3 1 4"
printf "%s\n\n" "----------------------------------"

echo "Level 4 -    up   -   down  -   left  -  right"
echo "Level 4 - 2 2 3 1 - 3 2 1 2 - 3 1 2 3 - 1 3 3 2"
echo "----------------------------------"
./$1 "2 2 3 1 3 2 1 2 3 1 2 3 1 3 3 2"
printf "%s\n\n" "----------------------------------"

echo "Level 5 -    up   -   down  -   left  -  right"
echo "Level 5 - 2 3 3 1 - 3 2 1 2 - 2 1 2 3 - 1 3 3 2"
echo "----------------------------------"
./$1 "2 3 3 1 3 2 1 2 2 1 2 3 1 3 3 2"
printf "%s\n\n" "----------------------------------"

echo "============== Done ================"

echo "KO: You failed :("