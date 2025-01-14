import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--input", type = str, required = True, help = "Source file path")
parser.add_argument("--output", type = str, required = True, help = "Output files path")
parser.add_argument("--num", type = int, required = False, default = 10, help= "number of pieces to be cut")
parser.add_argument("--suffix", type = str, required= False, default=".dat", help="suffix of the generated files")

args = parser.parse_args()

with open(args.input,'r') as f:
    num_total = sum(1 for _ in f)

print('total lines: ' + str(num_total))

num_lines = int(num_total / args.num)+1

print('lines per file: ' + str(num_lines))

count = 0
i = 0
out = None
with open(args.input,'r') as f:
    for line in f:
        if count % num_lines == 0:
            if out: out.close()
            out = open(args.output + '_' + str(i) + args.suffix, 'w')
            i+=1
        out.write(line)
        count += 1

    out.close()

print("Done")