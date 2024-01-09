# Here we will write the script that when run we will get a correctly formatted mermaid timeline (or any type of chart)

#!/bin/bash

outputfile="timeline.md"



pythonscript=`python3 timeline.py`

# echo $pythonscript >> $outputfile


# This part of the script makes up the actual mermaid syntax
# it loops through the 15 weeks in the semester and adds sections
# and soon to be content within each section.
echo "\`\`\`mermaid\ntimeline\n\ttitle CSC 392 Course Timeline\n\n" >> $outputfile
for i in {1..15}
do
    echo "\t\tsection Week $i" >> $outputfile
    echo "\t\t2023-09-07 : Lecture" >> $outputfile
done
echo "\n\`\`\`" >> $outputfile

# date=("")
# question=("")
# keyword=("")