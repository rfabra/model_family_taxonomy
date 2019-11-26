f = open("../common/methods.R")

method_lines = [l for l in f.readlines() if "mymethod" in l and "if" in l]

f.close()

methods = ["\"{}\",\n".format(m.split("\"")[1]) for m in method_lines]

out = "c <- (\n  "
out += '  '.join(methods)
out = out[:-2] + "\n)"

f = open("all_methods.R", "w")
f.write(out)
f.close()

