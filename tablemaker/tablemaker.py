#Example input, paste this into ./inp.txt
"""
Coefficients:
                                           Estimate Std. Error z value Pr(>|z|)    
(Intercept)                                0.037884   0.195417   0.194   0.8463    
home_or_awayHome                           0.106429   0.100773   1.056   0.2909    
distance_groupingfarther                  -0.229455   0.109013  -2.105   0.0353 *  
points2021                                 0.010394   0.002012   5.167 2.38e-07 ***
opponent_points2021                       -0.005595   0.002290  -2.443   0.0146 *  
home_or_awayHome:distance_groupingfarther  0.322718   0.144729   2.230   0.0258 *  
"""
#Then run python3 ./tablemaker.py
# Then check ./out.py and find:
"""
#table(
columns: 5,
table.cell([Coefficients:], colspan: 5)
[Variable], [Estimate], [Std. Error], [z value], [Pr(>|z|)],
[(Intercept)], [0.038], [0.195], [0.194], [0.846],
[home_or_awayHome], [0.106], [0.101], [1.056], [0.291],
[distance_groupingfarther], [-0.229], [0.109], [-2.105], [0.035],
[points2021], [0.010], [0.002], [5.167], [0.000],
[opponent_points2021], [-0.006], [0.002], [-2.443], [0.015],
[home_or_awayHome:distance_groupingfarther], [0.323], [0.145], [2.230], [0.026],
)
"""
def float_or_nop(s):
    # returns the input rounded to 3 d.p. if coercible to float, returns input unchanged if not 
    # might be worth changing this to 3 s.f.
    try:
        out = float(s)
        return '{:.3f}'.format(out)
    except ValueError:
        return s
import os
os.system('dos2unix inp.txt') #rstudio console output uses DOS newlines, this converts to unix ones
os.system('dos2unix inp.txt') #only seems to be a problem when pasting using `p` in vim, you  can remove these
f = open("inp.txt",'r')

linesout = []
for line in f.readlines():
    if line == '': 
        continue
    #split line into words
    parts = line.split(" ")
    # round floats, remove empty words, remove newlines 
    parts = [float_or_nop(part.rstrip()) for part in parts if part != '']
    # 't value' should be kept in one piece, so we'll rejoin any z/p/t values we find
    # as well as any 'Std. Error's that we've split
    newparts = []
    i = 0
    while i < len(parts):
        part = parts[i]
        print(part)
        if part.lower() == "std." and i+1 < len(parts) and parts[i+1].lower() == "error":
            newparts.append(f"{part} {parts[i+1]}")
            i += 2  # Move to the next part after concatenating
        elif part.lower() == "error":
            i += 1  # Move to the next part without concatenating
        elif part.lower() in ["z", "p", "t"] and i+1 < len(parts) and parts[i+1].lower() == "value":
            newparts.append(f"{part} {parts[i+1]}")
            i += 2
        elif part.lower() == "value":
            i += 1
        else:
            if set(part) != {"*"} and part != "" and part != " ":
                newparts.append(part)
            i += 1  # Move to the next part
    newparts = [word.rstrip() for word in newparts if word !=" "]
    linesout.append(newparts)


#no. columns = max length of any line
col_count = max([len(line) for line in linesout])
with open("out.txt",'w') as fout:
    fout.write("#table(\n")
    fout.write(f"columns: {col_count},\n")
    for line in linesout:
        if len(line) == 1:
            # If line has one word it's probably a title
            # So we'll make it span all the columns
            if line[0] == "" or line[0] == " " or line[0] == "  ":
                continue
            fout.write(f"table.cell([{line[0]}], colspan: {col_count})\n")
            continue
        elif len(line) == col_count-1:
            # Often the variable has no title, so the column names have a length of one less
            # We'll add a "Variable" title, so all the row lengths match
            line = ["Variable"] + line
        fout.write("["+ "], [".join(line) + "],\n") #adds square braces for typst tables
    fout.write(")\n")
