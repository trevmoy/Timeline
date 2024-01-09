"""
Here we will test pandas dataframes with running a script to make a mermaid timeline
"""
import pandas as pd

df = pd.read_csv('schedule.csv',index_col='date').sort_index()

df = df.reset_index()

def get_date(num) -> str:
    """
    This function returns the content of a cell in the date column according to the num parameter
    """
    return str(df.at[num, 'date'])

def get_question(num) -> str:
    """
    This function returns the content of a cell in the question column according to the num parameter
    """
    return str(df.at[num, 'question'])

def get_keyword(num) -> str:
    """
    This function returns the content of a cell in the keyword column according to the num parameter
    """
    return str(df.at[num, 'keyword'])
    