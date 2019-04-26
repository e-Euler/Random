#!/bin/sh
for filename in ./*;
        do
                printf "\rsetting title variable \t\t\t";
                printf "\r$filename\t\t\t";
                title=$(exiftool -Title $filename| cut -d ":" -f 2 | tr -d '[:space:]');
                printf "\rClearing metadata\t\t\t";
                exiftool -q -m -all= -overwrite_original $filename;
                printf "\rsetting title metadata\t\t\t";
                exiftool -q -m -Title=$title $filename;
                unset title;
        done

