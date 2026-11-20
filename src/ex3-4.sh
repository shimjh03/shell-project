#!/bin/bash

# 과목 이름과 점수를 저장할 배열
subjects=()
scores=()

while true
do
    echo "==================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "==================="

    read -p "메뉴를 선택하세요: " menu

    case $menu in

        1)
            read -p "과목 이름: " subject
            read -p "점수 입력 (0~100): " score

            if ! [[ "$score" =~ ^[0-9]+$ ]] || [ "$score" -lt 0 ] || [ "$score" -gt 100 ]; then
                echo "잘못된 점수입니다."
            else
                subjects+=("$subject")
                scores+=("$score")
                echo "성적이 추가되었습니다."
            fi
            ;;

        2)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "등록된 성적이 없습니다."
            else
                echo "----- 입력된 성적 -----"

                for i in "${!scores[@]}"
                do
                    echo "${subjects[$i]} : ${scores[$i]}점"
                done
            fi
            ;;

        3)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "등록된 성적이 없습니다."
            else
                total=0

                for score in "${scores[@]}"
                do
                    total=$((total + score))
                done

                average=$((total / ${#scores[@]}))

                echo "평균 점수: $average점"
            fi
            ;;

        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "등록된 성적이 없습니다."
            else
                total=0

                for score in "${scores[@]}"
                do
                    total=$((total + score))
                done

                average=$((total / ${#scores[@]}))

                if [ "$average" -ge 90 ]; then
                    echo "평균 등급: A"
                else
                    echo "평균 등급: B"
                fi
            fi
            ;;

        5)
            echo "프로그램을 종료합니다."
            break
            ;;

        *)
            echo "잘못된 메뉴입니다. 1~5를 입력하세요."
            ;;

    esac

    echo ""
done
