"""
Here we will test pandas dataframes with running a script to make a mermaid timeline

Still working on understanding how to get specific values from a new row every time it is run.
"""
import pandas as pd

df = pd.read_csv('schedule.csv',index_col='date').sort_index()

df = df.reset_index()

def get_date():
    for i in df['date']:
        print(i)
        
def get_question():
    for i in df['question']:
        print(i)

def get_keyword():
    for i in df['keyword']:
        print(i)

# get_date()
        
print("Test")