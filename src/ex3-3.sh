#!/bin/bash
echo "과목 수를 입력하세요 (2개 이상):"
read n 

sum=0

for ((i=1; i<=n; i++))
do
	echo "$i 번째 과목 점수를 입력하세요:"
	read score

	sum=$((sum + score))
	
	if [ "$score" -ge 90 ]; then
		echo "$i 번째 과목 등급: A"
	else
		echo "$i 번째 과목 등급: B"
	fi
done

average=$(echo "scale=2; $sum / $n" | bc)
echo "평균 점수: $average"

if [ "$sum" -ge $((90 * n))  ]; then
	echo "평균 등급: A"
else 
	echo "평균 등급: B"
fi

