# Here we will write the script that when run we will get a correctly formatted mermaid timeline (or any type of chart)

#!/bin/bash

outputfile="timeline.md"


# This part of the script makes up the actual mermaid syntax
echo "\`\`\`mermaid\ntimeline\n\ttitle CSC 392 Course Timeline\n" >> $outputfile
# for loop loops through each class of the semester

for i in {1..30}
do
    # If else loop for determining which week should be echoed
    if [ $(($i)) -eq 1 ];
    then
        echo "\t\tsection Week 1" >> $outputfile
    elif [ $(($i % 2)) -eq 0 ] && [ $(($i)) != 1 ];
    then
        currweek=$(($i / 2))
        echo "\t\tsection Week $currweek" >> $outputfile
    fi

    # checking for the special case where the remainder is 1
    if [ $(($i)) -eq 1 ];
    then
        date1=$(python3 -c "import timeline; print(timeline.get_date(1))")
        question1=$(python3 -c "import timeline; print(timeline.get_question(1))")
        keyword1=$(python3 -c "import timeline; print(timeline.get_keyword(1))")
        echo "\t\t$date1 - $keyword1 - $question1" >> $outputfile
    # checks for even
    elif [ $(($i % 2)) -eq 0 ] && [ $(($i)) != 1 ];
    then
    # commands call the specified function from the python script 
        date2=$(python3 -c "import timeline; print(timeline.get_date($i))")
        question2=$(python3 -c "import timeline; print(timeline.get_question($i))")
        keyword2=$(python3 -c "import timeline; print(timeline.get_keyword($i))")
        echo "\t\t$date2 - $keyword2 - $question2" >> $outputfile
    elif [ $(($i % 3)) -eq 0 ] && [ $(($i)) != 1 ];
    then
    # checking if the remainder is any other odd number
        # commands run the functions for the 2nd day of the week
        date3=$(python3 -c "import timeline; print(timeline.get_date($i))")
        question3=$(python3 -c "import timeline; print(timeline.get_question($i))")
        keyword3=$(python3 -c "import timeline; print(timeline.get_keyword($i))")
        echo "\t\t$date3 - $keyword3 - $question3" >> $outputfile
    fi

done
echo "\n\`\`\`" >> $outputfile
