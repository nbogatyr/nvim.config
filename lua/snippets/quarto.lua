return {

  -- Snippet to create a python cell in a Quarto file
  s({ trig = "cp" }, { fmt(
    [[ 
```{{python}}
{}
```
]],
    {
      i(1),
    }
  ) }),
}
