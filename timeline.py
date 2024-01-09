"""
Here we will test pandas dataframes with running a script to make a mermaid timeline
"""
import pandas as pd

df = pd.read_csv('schedule.csv',index_col='date').sort_index()

df = df.reset_index()

print(df.to_string())

for i in df['date']:
    print(i)

for i in df['question']:
    print(i)

for i in df['keyword']:
    print(i)

with open("test.txt", "a") as f:
    f.write("")
    