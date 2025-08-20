1.  Indexing and selecting in Series

``` python
s = pd.Series([3.14, 2.718, 1.618], index = ["pi", "euler's number", "golden ratio"])

s[s > 2]
```

2.  Creating and plotting a DataFrame

``` python
df1 = pd.DataFrame(data={'age':[23,78,22,19,45,33],'state':['iowa','dc','california','texas','washington','dc'],'num_children':[2,2,0,1,2,1],'num_pets':[0,4,0,5,0,0]},index=['john','mary','peter','jeff','bill','lisa'])

df1.plot(kind = "bar", y = "age")
```

3.  Adding new row and handling missing data

``` python
df2 = pd.DataFrame(data={'age':[0],'state':['new york'],'num_children':[1],'num_pets':[0]},index=['mike'])
df3 = pd.concat([df1,df2])
df2['age'] = df1['age'].median() # Calculate and add the median age of all other people to 'mike'
df3 = pd.concat([df1,df2]) # Update the DataFrame
```