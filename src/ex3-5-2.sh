#!/bin/bash

# 내부 함수 정의
list_files() {
    echo "===== 파일 목록 ====="
    ls "$@"
}

# 입력 인자 확인
if [ $# -eq 0 ]; then
    echo "사용법: $0 [ls 옵션]"
    echo "예시: $0 -l"
    exit 1
fi

# 함수 실행
list_files "$@"
