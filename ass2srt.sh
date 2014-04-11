#!/bin/sh

# convert .ass subs to .srt
# as seen here: http://zegmaarwim.blogspot.gr/2011/04/convert-subtitles-ass-to-srt.html
# run with: ./ass-to-srt.sh < sub.srt >> sub.srt

grep Dialogue | \
awk -F, 'BEGIN { TELLER="1"; }
         { printf("%s\n0%s,%s0 --> 0%s,%s0\n",
                       TELLER,substr($2,0,7),substr($2,9,2),substr($3,0,7),substr($3,9,2));
           TELLER++;}
         { DIALOGUE=$10;
           for(i=11;i<=NF;i++)
           {
               DIALOGUE=DIALOGUE","$i
           };
           printf ("%s\n\n",DIALOGUE)}'