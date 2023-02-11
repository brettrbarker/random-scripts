# Python script to use Gimpformat to flatten an XCF file
# Usage: python flatten-xcf.py <inputfile> <outputfile>

import sys
import gimpformat

if len(sys.argv) != 3:
    print("Usage: python flatten-xcf.py <inputfile> <outputfile>")
    sys.exit(1)

inputfile = sys.argv[1]
outputfile = sys.argv[2]

gimpformat.flatten(inputfile, outputfile)



