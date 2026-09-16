# Exercise solutions

Possible solutions for the challenges in `workshop/Pandas.ipynb`. There is usually more than one correct answer.

## Challenge 1: Filter a Series

```python
s = pd.Series([3.14, 2.718, 1.618], index=["pi", "euler's number", "golden ratio"])
s[s > 2]
```

## Challenge 2: Label the rows

```python
df.index = ["alice", "bob", "charles"]
df

# Bonus: rename the columns
df.columns = ["weight_kg", "born", "pastime"]
df
```

## Challenge 3: Build a DataFrame from a table

```python
friends = pd.DataFrame(
    {
        "age":      [41, 42, 34, 48],
        "city":     ["Melbourne", "Sydney", "Perth", "Hobart"],
        "children": [0, 3, 0, 1],
        "pets":     [0, 4, 0, 5],
    },
    index=["alice", "bob", "charles", "darwin"],
)
friends
```

## Challenge 4: Add column names

```python
wdbc_df.columns = col_names
wdbc_df.head()

# Alternative: pass the names when reading the file
wdbc_df = pd.read_csv("data/wdbc.data.csv", header=None, names=col_names)
```

## Challenge 5: Count missing values

```python
# Missing values per column
wdbc_df.isnull().sum()

# Missing values per row (axis=1 sums across the columns of each row)
wdbc_df.isnull().sum(axis=1)
```

## Challenge 6: Compare the groups

```python
clean_wdbc.groupby("Diagnosis")["radius1"].mean()
```

Malignant (`M`) tumours have the larger mean radius.

## Challenge 7: Plot the friends

```python
friends.plot(kind="bar", y="age", title="Age")
plt.show()

# Bonus
friends.plot(kind="bar", y=["children", "pets"])
plt.show()
```

## Challenge 8: Add a friend

```python
eugene = pd.DataFrame(
    {"age": [0], "city": ["Adelaide"], "children": [1], "pets": [0]},
    index=["eugene"],
)
friends = pd.concat([friends, eugene])

# Replace the placeholder age with the median age of everyone else
friends.loc["eugene", "age"] = friends.drop("eugene")["age"].median()
friends
```
