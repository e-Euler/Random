#!/bin/sh
for filename in './*';
do
  title=$(exiftool -Title $filename| cut -d ":" -f 2 | tr -d '[:space:]');
  exiftool -all= $filename;
  exiftool -Title=$title $filename;
  title=
done

