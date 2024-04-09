def FB(pairs, n, N):
    outputList = []
    for i in range(n, N+1):
        out = ""
        for factor in pairs:
            if i % factor == 0:
                out += pairs[factor]
        if out == "":
            out = str(i)
        outputList.append(out)
    return outputList


factorPairs = {3: "Fizz", 5: "Buzz"}
fizzbuzz = FB(factorPairs, 0, 100)
for x in fizzbuzz:
    print(x)
