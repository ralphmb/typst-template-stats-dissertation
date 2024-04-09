## My Stats Dissertation

This is the template I made for my final year project in Maths and Stats.
The code used for generating headers was written by Jacopo Zagoli, [and comes from this repo](https://github.com/zagoli/simple-typst-thesis).
I think I've changed it a bit but it's still almost entirely their work, used under the Apache license, thank you to them as I'd not have been able to figure the headers out myself.
The rest is mine. I've removed most of the content except one plot and one reference.
Feel free to reuse anything if you can find a use for it.

The actual thesis can be found under */writeup/*. If you install typst and compile the file *main.typ* using `typst compile main.typ` or `typst watch main.typ` for automatic compilation, you'll generate the file 'main.pdf'. The 'sections' folder contains the files for each section - literature review, bibliography etc. 'assets' is where I put all images, large code files to be read etc.

I also used Typst for the thesis presentation. This is found in presentation/pres.typ. Compiling this will get you a pdf with one slide per page. It uses a package called Polylux.



`wordcounter` is a small script I used to check the wordcount while writing. There's definitely better ways to do this but it's a good approximation. It just calls `wc -w` on each relevant source file and adds the results, giving an itemised breakdown.
`committer` is a script I used for backups. If you're using git version control you could write it in here. It backs up relevant notes from my Obsidian vault, copies code from my working R folder and places it in the writeup assets for addition into appendices, and opens Google Drive in my browser.
`tablemaker.py` is a script that can take copy-pasted R output and turn it into Typst tables. Since I had to talk about a million different regression models and their coefficients this saved me quite a lot of time. Ideally this might be written in R or Typst itself.

Thanks!
