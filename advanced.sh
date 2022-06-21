#!/bin/bash

FILE=tmp.txt

if [ "$#" -ne 1 ]; then
    echo "Please provide path to user executable.\n"
	exit
fi

# Run and save
echo "" > ${FILE}
while IFS="" read -r p || [ -n "$p" ]
do
	./$1 "$p" >> ${FILE}
done < inputs.txt
tail -n +2 "${FILE}" > ${FILE}.tmp
mv ${FILE}.tmp ${FILE}
printf "Comparing...\n"

# Diff the files and get the line numbers for reporting
DIFF=$(diff ${FILE} grids.txt --unchanged-line-format="" --new-line-format="%dn " --old-line-format="")
if [ "$DIFF" == "" ]; then
	echo "[SUCCESS] You passed :)"
else
    echo "[FAIL] Output not correct :("
	echo ""
	for LN in $DIFF
	do
		grid_id=$((( ($LN+3)/4 )))
		grid_line_start=$((( ($grid_id-1)*4+1 )))
		grid_line_end=$((( $grid_line_start+3 )))
		input=$(sed "${grid_id}q;d" inputs.txt)
		expected=$(sed -n "$grid_line_start,${grid_line_end}p" grids.txt)
		got=$(sed -n "$grid_line_start,${grid_line_end}p" ${FILE})
		
		echo "Error in grid $grid_id:"
		echo "========================================"
		echo "Input: $input"
		echo
		echo "Got:"
		printf "$got\n"
		echo
		echo "Expected:"
		printf "$expected\n"
		echo "========================================"
		echo
		echo "Checker has been stopped. More errors may follow."
		exit 1
	done
fi
