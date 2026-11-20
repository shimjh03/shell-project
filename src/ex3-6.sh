#!/bin/bash

# 폴더 이름 입력
read -p "폴더 이름을 입력하세요: " folder

# 폴더 존재 여부 확인
if [ -d "$folder" ]; then
    echo "폴더가 이미 존재합니다."
else
    mkdir -p "$folder"
    echo "폴더를 생성했습니다."
fi

# 파일 5개 생성
for i in {1..5}
do
    touch "$folder/file$i.txt"
done

echo "파일 5개를 생성했습니다."

# 파일 압축
tar -czf "${folder}.tar.gz" -C "$folder" file1.txt file2.txt file3.txt file4.txt file5.txt

echo "파일 압축이 완료되었습니다."

# 압축 해제 폴더 생성
extract_folder="${folder}_extracted"
mkdir -p "$extract_folder"

# 압축 해제
tar -xzf "${folder}.tar.gz" -C "$extract_folder"

echo "압축 해제가 완료되었습니다."

# 결과 확인
echo "-------------------------"
echo "생성된 파일 목록:"
ls -l "$folder"

echo "압축 해제된 파일 목록:"
ls -l "$extract_folder"
echo "-------------------------"
