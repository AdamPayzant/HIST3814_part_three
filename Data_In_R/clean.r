install.packages("tidyverse")
install.packages("tidytext")

library(tidyverse)
# this is a part of Tidyverse too-- I'll touch on it shortly
library(magrittr)
library("tidytext")

fairyElements <- read_csv("fairy-elements.csv")
fairyElements <- as_tibble(fairyElements)
head(fairyElements)

colnames(fairyElements) %<>% str_replace_all("\\s", "_") %<>% tolower()
head(fairyElements)

# Replacing NA with unknown
fairyUnknown <- fairyElements %>% replace_na(list(case_notes = "Unknown"))

print("NA is replaced with 'Unknown':")
head(fairyUnknown)


fairyElements <- fairyElements %>% replace_na(list(case_notes = "Unknown"))

fairyElements$case_notes %<>% str_remove_all("\\?")

# note: a pipe pushes the object preceding it (in this case 'fairyElements$case_notes') as the first argument of the function that follows it

head(fairyElements)

motif <- fairyElements %>%
  count(motif_type, sort = TRUE)

# 'sort = TRUE' means that the table created from this will be sorted from largest to smallest count

head(motif)




# what happens if we do the same thing as before?
folkNotes <- fairyElements %>%
  count(folk_notes, sort = TRUE)

head(folkNotes)




# Create an ID column
fairyElements$id <- 1:nrow(fairyElements)

# make a data frame with just the IDs and contents of 'folk_notes'-- I noticed there are more odd "?" in this column so I included this cleaning step within this action
folkNotes <- tibble(id = fairyElements$id, text = (str_remove_all(fairyElements$folk_notes, "\\?")))

# now we'll use tidytext's unnest_tokens() function to tokenize the text
folkNotes <- folkNotes %>%
  unnest_tokens(word, text)

# let's look at the first couple tokens
head(folkNotes)




folkNotes <- folkNotes %>%
  anti_join(stop_words)

# an "anti_join" means that 'stop_words' is joined to the data you load in ('folkNotes') and any time a word matches in both datasets, it's removed.

head(folkNotes)

folkNotesFreq <- folkNotes %>%
  count(word, sort = TRUE)

# show it ALL
folkNotesFreq

# only show the words that occur more than 50 times
folkNotes_gt <- folkNotesFreq %>%
  filter(n > 50)

print("Words which occur >50 times: ")
folkNotes_gt

# only show words that contain 'tree'-- uses str_detect() from stringr!
folkNotes_trees <- folkNotesFreq %>%
  filter(str_detect(word, "tree"))

print("Trees found in folk notes: ")
folkNotes_trees

devilAppearence <- read_csv("devilappearence.csv")

# adding an id-- IF YOUR DATASETS DON'T HAVE A MATCHING COLUMN (ex "name" or "date") don't just add an ID, first use 'bind_rows()', which works the same way as 'full_join()'
devilAppearence$id <- 1:nrow(devilAppearence)

devilAppearence <- devilAppearence %>% drop_na(Devil_Text, FolkNotes)



unnaturalBeingsInfo <- full_join(fairyElements, devilAppearence, by = "id")
unnaturalBeingsInfo
