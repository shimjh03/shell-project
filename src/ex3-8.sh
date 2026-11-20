#!/bin/bash

DB_FILE="DB.txt"

# 팀원 정보 입력 함수
input_members() {
    while true
    do
        echo "-------------------------"
        read -p "팀원 이름 (종료하려면 q 입력): " name

        if [ "$name" = "q" ]; then
            break
        fi

        if [ -z "$name" ]; then
            echo "이름을 입력하세요."
            continue
        fi

        read -p "생일 또는 전화번호: " info

        if [ -z "$info" ]; then
            echo "정보를 입력하세요."
            continue
        fi

        echo "$name | $info" >> "$DB_FILE"
        echo "정보가 저장되었습니다."
    done
}

while true
do
    echo "========================="
    echo "   팀원 정보 데이터베이스"
    echo "========================="
    echo "1) 팀원 정보 추가"
    echo "2) DB 초기화 후 새로 작성"
    echo "3) 저장된 정보 확인"
    echo "4) 종료"
    echo "========================="

    read -p "메뉴를 선택하세요: " menu

    case $menu in

        1)
            touch "$DB_FILE"
            input_members
            ;;

        2)
            > "$DB_FILE"
            echo "기존 데이터가 초기화되었습니다."
            input_members
            ;;

        3)
            if [ -s "$DB_FILE" ]; then
                echo "----- 저장된 팀원 정보 -----"
                cat "$DB_FILE"
            else
                echo "저장된 정보가 없습니다."
            fi
            ;;

        4)
            echo "프로그램을 종료합니다."
            break
            ;;

        *)
            echo "잘못된 입력입니다."
            ;;

    esac

    echo ""
done
