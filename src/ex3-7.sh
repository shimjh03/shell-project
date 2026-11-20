#!/bin/bash

# 폴더 이름 입력
read -p "폴더 이름을 입력하세요: " folder

# 폴더 생성
mkdir -p "$folder"

# 파일 5개 생성 및 하위 폴더와 링크 생성
for i in {1..5}
do
    filename="file$i.txt"
    subfolder="$folder/file$i"

    # 파일 생성
    touch "$folder/$filename"

    # 파일 이름으로 하위 폴더 생성
    mkdir -p "$subfolder"

    # 하위 폴더에 원본 파일의 심볼릭 링크 생성
    link_path="$subfolder/$filename"

    if [ ! -e "$link_path" ] && [ ! -L "$link_path" ]; then
        ln -s "../$filename" "$link_path"
    fi

    echo "$filename 생성 및 링크 완료"
done

echo "-------------------------"
echo "최종 폴더 구조"
tree "$folder"
echo "-------------------------"
