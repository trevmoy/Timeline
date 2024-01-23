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
    # checking for the special case where the remainder is 1 (in terms of j)
    if [ $(($j)) -eq 1 ];
    then
        # For lecture
        lecturedate1=$(python3 -c "import timeline; print(timeline.get_df1_date($i))")
        question1=$(python3 -c "import timeline; print(timeline.get_df1_question($i))")
        keyword1=$(python3 -c "import timeline; print(timeline.get_df1_keyword($i))")
        

        echo "\t\tsection Week 1" >> $outputfile
        echo "\t\t$lecturedate1 - $keyword1 - $question1" >> $outputfile

    elif [ $(($j % 2)) -eq 0 ];
    # checks for even
    then
        # Gets current week
        currweek=$(($j / 2))
    
        lecturedate2=$(python3 -c "import timeline; print(timeline.get_df1_date($i))")
        question2=$(python3 -c "import timeline; print(timeline.get_df1_question($i))")
        keyword2=$(python3 -c "import timeline; print(timeline.get_df1_keyword($i))")

        # For lab
        labdate1=$(python3 -c "import timeline; print(timeline.get_df2_date($currweek))")
        topic1=$(python3 -c "import timeline; print(timeline.get_df2_topic($currweek))")
        activity1=$(python3 -c "import timeline; print(timeline.get_df2_activity($currweek))")

        echo "\t\t$lecturedate2 - $keyword2 - $question2" >> $outputfile
        echo "\t\t$labdate1 - $topic1 - $activity1" >> $outputfile
        
        # Outputs the current week as a section
        echo "\t\tsection Week $currweek" >> $outputfile
    else
        # checking if the remainder is any other odd number
        # commands run the functions for the 2nd day of the week
        # does not count 3 because it messes the output up

        lecturedate3=$(python3 -c "import timeline; print(timeline.get_df1_date($i))")
        question3=$(python3 -c "import timeline; print(timeline.get_df1_question($i))")
        keyword3=$(python3 -c "import timeline; print(timeline.get_df1_keyword($i))")

        echo "\t\t$lecturedate3 - $keyword3 - $question3" >> $outputfile
    fi
    

done
echo "\n\`\`\`" >> $outputfile
