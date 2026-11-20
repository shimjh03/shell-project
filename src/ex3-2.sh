#!/bin/bash

echo "첫 번쨰 숫자 입력: "
read x
echo "두 번째 숫자 입력: "
read y

result1=$(echo "scale=10; $x *$x" \ bc)
result2=$(echo "scale=10; $y* $y" \ bc)

echo "첫 번째 값의 제곱: $result1"
echo "두 번째 값의 제곰: $result2"

