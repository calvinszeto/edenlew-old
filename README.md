# edenlew Cargo Collective

This is the source code for www.edenlew.com, hosted by Cargo Collective.

## To Deploy

There are some limitations to Cargo Collective assets:
* Files may not be larger than 1.5MB each
* The total for all files may not exceed 15 MB
* There may be no other directories within the assets directory

As a result, I will write a script to do the following:
* minify all javascripts and concatenate them into 1.5MB files
* precompile all templates
* flatten all directories into one assets folder
