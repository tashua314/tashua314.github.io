#!/bin/sh
#
# Shell script for creating post 
# based on jekyll's layout format

# get created date
date=`date +%Y-%m-%d`
datetime=`date "+%Y-%m-%d %H:%M:%S"`

# get file title from command line
# e.g. How to use web worker api
read -p "Post Title: " title
# e.g. programming javascript blog
read -p "Categories: " category

# modify $title for jekyll's default theme
# (small capital with `-`)
# e.g. How to use web worker api > how-to-use-web-worker-api
# 1. convert all to small capital
titleSmallCapital=`tr "[:upper:]" "[:lower:]" <<< $title`
# echo $titleSmallCapital
# 2. split with space
IFS_ORIGINAL="$IFS"
IFS=" "
arr=($titleSmallCapital) #set all words into array 
IFS="$IFS_ORIGINAL"
# (debug)
titleFinal=()
count=0
for v in "${arr[@]}"; do
    if [ $count -eq 0 ] #you need space before and after blackets
        then
            titleFinal+=$v
            count+=1
    else
            titleFinal+="-"$v
            count+=1
    fi
done

# create file title
filetitle=$date-$titleFinal.md

# write default layout to the file
echo '---' >> _posts/$filetitle
echo 'layout: post' >> _posts/$filetitle
echo 'title: '$title >> _posts/$filetitle
echo 'date: "'$datetime'"' >> _posts/$filetitle
echo 'categories: '$category >> _posts/$filetitle
echo 'type: posts' >> _posts/$filetitle
echo 'comments: true' >> _posts/$filetitle
echo '---' >> _posts/$filetitle
echo '' >> _posts/$filetitle
echo '[]()' >> _posts/$filetitle
echo '' >> _posts/$filetitle
echo '---' >> _posts/$filetitle
echo '' >> _posts/$filetitle
echo '### 編集後記' >> _posts/$filetitle
echo '' >> _posts/$filetitle

# open in subilme
vi _posts/$filetitle
