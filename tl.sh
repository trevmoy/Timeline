# Here we will write the script that when run we will get a correctly formatted mermaid timeline (or any type of chart)

#!/bin/bash

outputfile="timeline.md"

date=("")

echo "" >> $outputfile
echo "$allprlist" >> $outputfile
echo "


my prs" >> $outputfile
echo "$myprlist" >> $outputfile