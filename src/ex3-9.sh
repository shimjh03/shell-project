#!/bin/bash

# DB.txt 파일 경로 설정
DB_FILE="$(dirname "$0")/DB.txt"

# DB 파일 존재 여부 확인
if [ ! -f "$DB_FILE" ]; then
    echo "DB.txt 파일이 존재하지 않습니다."
    exit 1
fi

# 이름 입력
read -p "검색할 팀원 이름을 입력하세요: " name

# 이름 검색
result=$(awk -F ' \\| ' -v name="$name" '$1 == name {print}' "$DB_FILE")

# 검색 결과 출력
if [ -n "$result" ]; then
    echo "-------------------------"
    echo "검색 결과:"
    echo "$result"
    echo "-------------------------"
else
    echo "해당 팀원의 정보를 찾을 수 없습니다."
fi
