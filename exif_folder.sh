#!/bin/sh
for filename in ./*;
        do
                printf "\rsetting title variable                ";
                printf "\r$filename\t\t\t";
                title=$(exiftool -Title "$filename" | cut -d ":" -f 2 | tr -d '[:space:]');
                printf "\rClearing metadata                      ";
                exiftool -q -m -overwrite_original -all= -overwrite_original "$filename";
                printf "\rsetting title metadata                 ";
                exiftool -q -m -overwrite_original -Title="$title" "$filename";
                unset title;
        done


