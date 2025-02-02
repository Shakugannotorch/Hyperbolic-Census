import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--input", type = str, required = True, help = "Source file path")
parser.add_argument("--output", type = str, required = True, help = "Output files path")
parser.add_argument("--num", type = int, required = False, default = 10, help= "number of pieces to be combined")
parser.add_argument("--suffix", type = str, required= False, default=".dat", help="suffix of the input files")

args = parser.parse_args()

line_count = 0

with open(args.output,'w') as f:
    for i in range(args.num):
        try:
            with open(args.input + '_' + str(i) + args.suffix, 'r') as t:
                for line in t:
                    f.write(line)
                    line_count +=1
        except:
            print('file' + args.input + '_' + str(i) + args.suffix+' fails when reading and is not merged')

print('total lines: ' + str(line_count))
