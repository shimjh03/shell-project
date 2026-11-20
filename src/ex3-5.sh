#!/bin/bash

while true
do
    echo "========================="
    echo "   Linux System Monitor"
    echo "========================="
    echo "1) 사용자 정보 확인"
    echo "2) CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "========================="

    read -p "메뉴를 선택하세요: " menu

    case $menu in

        1)
            echo "----- 사용자 정보 -----"
            whoami
            echo "현재 로그인 사용자:"
            who
            ;;

        2)
            echo "----- CPU 사용 정보 -----"
            top -bn1 | grep "%Cpu"
            ;;

        3)
            echo "----- 메모리 사용량 -----"
            free -h
            ;;

        4)
            echo "----- 디스크 사용량 -----"
            df -h
            ;;

        5)
            echo "프로그램을 종료합니다."
            break
            ;;

        *)
            echo "잘못된 입력입니다. 1~5를 선택하세요."
            ;;

    esac

    echo ""
done
