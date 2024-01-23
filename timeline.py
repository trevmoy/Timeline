"""
Here we will test pandas dataframes with running a script to make a mermaid timeline
"""
import pandas as pd

# Dataframe 1 for the normal class schedule
df1 = pd.read_csv('schedule.csv',index_col='date').sort_index()
# Dataframe 2 for the normal class schedule
df2 = pd.read_csv('labschedule.csv',index_col='date').sort_index()

df1 = df1.reset_index()
df2 = df2.reset_index()
# For df1

def get_df1_date(num) -> str:
    """
    This function returns the content of a cell in the date column according to the num parameter
    """
    return str(df1.at[num, 'date'])

def get_df1_question(num) -> str:
    """
    This function returns the content of a cell in the question column according to the num parameter
    """
    return str(df1.at[num, 'question'])

def get_df1_keyword(num) -> str:
    """
    This function returns the content of a cell in the keyword column according to the num parameter
    """
    return str(df1.at[num, 'keyword'])

# For df2

def get_df2_date(num) -> str:
    """
    This function returns the content of a cell in the date column according to the num parameter
    """
    return str(df2.at[num, 'date'])

def get_df2_topic(num) -> str:
    """
    This function returns the content of a cell in the topic column according to the num parameter
    """
    return str(df2.at[num, 'topic'])

def get_df2_activity(num) -> str:
    """
    This function returns the content of a cell in the activity column according to the num parameter
    """
    return str(df2.at[num, 'activity'])
    