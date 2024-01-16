# Here we will write the script that when run we will get a correctly formatted mermaid timeline (or any type of chart)

#!/bin/bash

outputfile="timeline.md"


# This part of the script makes up the actual mermaid syntax
echo "\`\`\`mermaid\ntimeline\n\ttitle CSC 392 Course Timeline\n" >> $outputfile
# for loop loops through each class of the semester

for i in {0..29}
do
    # If else for determining which week should be output
    # This if else condition uses j which is the for loops iteration + 1 so that we get the correct number of 
    j=$(($j + 1))
    if [ $(($j % 2)) -eq 0 ] && [ $(($j)) != 1 ] && [ $(($j)) != 2 ];
    then
        currweek=$(($j / 2))
        echo "\t\tsection Week $currweek" >> $outputfile
    fi

    # checking for the special case where the remainder is 1 (in terms of j)
    if [ $(($j)) -eq 1 ];
    then
        date1=$(python3 -c "import timeline; print(timeline.get_date($i))")
        question1=$(python3 -c "import timeline; print(timeline.get_question($i))")
        keyword1=$(python3 -c "import timeline; print(timeline.get_keyword($i))")
        echo "\t\tsection Week 1" >> $outputfile
        echo "\t\t$date1 - $keyword1 - $question1" >> $outputfile
    elif [ $(($j % 2)) -eq 0 ];
    # checks for even
    then
        date2=$(python3 -c "import timeline; print(timeline.get_date($i))")
        question2=$(python3 -c "import timeline; print(timeline.get_question($i))")
        keyword2=$(python3 -c "import timeline; print(timeline.get_keyword($i))")
        echo "\t\t$date2 - $keyword2 - $question2" >> $outputfile
    
    else
        # checking if the remainder is any other odd number
        # commands run the functions for the 2nd day of the week
        # does not count 3 because it messes the output up
        date3=$(python3 -c "import timeline; print(timeline.get_date($i))")
        question3=$(python3 -c "import timeline; print(timeline.get_question($i))")
        keyword3=$(python3 -c "import timeline; print(timeline.get_keyword($i))")
        echo "\t\t$date3 - $keyword3 - $question3" >> $outputfile
    fi

done
echo "\n\`\`\`" >> $outputfile
