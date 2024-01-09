# Here we will write the script that when run we will get a correctly formatted mermaid timeline (or any type of chart)

#!/bin/bash

outputfile="timeline.md"


# This part of the script makes up the actual mermaid syntax
echo "\`\`\`mermaid\ntimeline\n\ttitle CSC 392 Course Timeline\n" >> $outputfile
# for loop loops through each class of the semester
for i in {1..25}
do
    # Note: the semester is 15 weeks long but there are multiple classes per week
    # echo "\t\tsection Week $i" >> $outputfile

    # commands call the specified function from the python script
    date=$(python3 -c "import timeline; print(timeline.get_date($i))")
    question=$(python3 -c "import timeline; print(timeline.get_question($i))")
    keyword=$(python3 -c "import timeline; print(timeline.get_keyword($i))")

    echo "\t\t$date - $keyword - $question" >> $outputfile
done
echo "\`\`\`" >> $outputfile
