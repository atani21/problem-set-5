### Number of trees

```{r warning = FALSE, message = FALSE}
treecount <- vector(mode = "numeric", length = 100)

for(i in seq_along(treecount)) {
  tree_num <- randomForest(
    formula = colrac ~ .,
    data = gss_train)
  
  treecount[i] <- which.min(tree_num$mse)
}
```

```{r}
many_trees <- tibble(number = treecount)

many_trees %>% 
  ggplot(aes(x = number)) +
  geom_histogram() +
  labs(title = "Optimal number of trees",
       x = "Tree number",
       y = "Frequency")
```