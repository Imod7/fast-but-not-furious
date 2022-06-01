## Description
Script that executes multiple searches at once by opening automatically a new firefox window with multiple tabs each of which corresponds to a search result.

## Run script
1. Open a terminal window
2. `> git clone https://github.com/Imod7/fast-but-not-furious.git`
3. `> cd fast-but-not-furious`
4. Before running the commands below, please replace `keyword1` and `keyword2` with the keywords you are looking for.
   ### Run in Firefox
   4.1 `> sh fast-but-not-furious-firefox.sh keyword1 keyword2`
   ### Run in Chrome
   4.2 `> sh fast-but-not-furious-chrome.sh keyword1 keyword2`

Note : You can also search for a combination of keywords as follows : 
`sh fast-but-not-furious.sh keyword+keyword2`

## Make changes to the script
You can change the arrays defined in the script so that the searches adjust to your needs.

You can change the :
1. Github organizations
2. Github repos
3. Web searches

by changing the contents of the arrays defined in the beginning of the script.

### A screenshot from running the script on the terminal
![fast-not-furious-script-screenshot](/fast_not_furious.png)

### Short Walkthrough of running the script in firefox(gif)
![Recording](fast-not-furious-firefox.gif "Short recording from the running the script")
