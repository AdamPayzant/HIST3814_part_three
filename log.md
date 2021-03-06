# Part 3 Log

Edward Adam Payzant,
SN: 101082175

Following the "Going Further Sequence"

## Notes

* I did have to add a .gitignore to this.
I know you said you wanted everything, but nothing critical is being ignored as it's workspace configs, the open refine binary, etc
* The name of the directory containing the work can be found at the top of each section

## Open Refine

`./OpenRefine`

Though I think I did the regex tutorial correctly, I still opted to download the premade file just in case I did something wrong that I missed.

When I attempted to load the data, I initially went through the key collision method.
In this, the metaphone3 function was the only one that successfully found a single collision.
Even switching to nearest neighbor, I wasn't finding any clusters without setting the values so high that everything was becoming clusters.
At the end I got the source table down the 152.
That said, my data from part 2 won't load in properly (there appears to be some formatting issue with the CSV I made) and the provided data appears to be precleaned.

Going through the recipients, I'm even more confident the data is precleaned, as the only clusters found were Secretaries of State and it was down.

I think I roughly know what's going on under the hood from my ML classes, but it's really interesting to see it being used for not outright CS-y things.

## Cleaning and Manipulating Data with R 

`./Data_In_R`

As an opening aside, I didn't realize R packages had to be built from source.
Wow they take a while.

Once that's all installed, I continue to get thrown off my R's syntax with the pipes.

With the `NA` values, I would generally just outright remove it when preparing data for computation.
This is my theory focused ML background rearing its ugly head again where I either have too much data to know what to do with or it's small enough I can manually edit it.
In this instance however, I recognize the data could be used elsewhere, and the unlabeled data could be valuable in itself.

It's interesting how you can really tell R is a mature language for data science.
The languages I usually work in, any string related information.
For example, with the stop words filtering.
In a lot of the languages I usually work in, I would have to manually create the stop words list and manually filter.

If you couldn't tell, going through the tutorial part was relatively straightforward and painless, so I didn't have much to say.

Cleaning the devil appearance data, I start by dropping all NA's.
This is the result of me not being able to conditionally drop only if deviltext and folknotes are both empty.
That's all I've done for now, but I do want to come back to this.

## Topic Modeling in R

`./Topic_Model_R`

Gah, I'm having some annoying issues with using packages for this one.
It's some g++ compilation error, my guess is it's a Linux issue.
I read through the tutorial so I know how it should work and it seems quite interesting, but I want to get other tasks done before I go too far down this debug rabbit hole.

## Network Analysis in Python

`./Network_Analysis_Python`

So to compare the centrality with the degrees, I initially tried to convert the centrality to a dataframe in the same format as the degrees.
Pandas is not my strong suit however so I inevitably ran into issues.
I eventually just gave up and printed the centrality sorted by value (instead of the standard key).
Through this you can notice that while Ashbel Smith has a higher degree, Anson Jones has a higher centrality.
After doing this, I then read the next step part of that tutorial  (I really need to be better about following directions for these tutorials).
However you do it, if I'm understanding it correctly, it means Smith was sending more letters directly while Jones had the larger network.

## Webmapping with Leaflet

`./Leaflet`

Oh boy, web stuff.
Last semester when I was applying to jobs in my field for when I graduate, I had one rule: "anything but web".
I don't actually mind the backend that much (though some libraries make me want to pull my hair out), but I can't make a nice looking website to save my life.