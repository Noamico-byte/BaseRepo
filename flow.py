#!/usr/bin/python

import argparse
import subprocess
import sys

def argparser():
    """
    """
    parser = argparse.ArgumentParser()

    parser.add_argument("--string1", help="string to look for", type=str, required=False)
    parser.add_argument("--string2", help="string to replace", type=str, required=False)
    parser.add_argument("-p", "--path", help="path to file", required=False)

    args = parser.parse_args()
    return args

def replace_str(string1, string2, path):
    """
    """
    rc, out = subprocess.getstatusoutput("sed -i 's/{0}/{1}/g' {2}".format(string1, string2, path))

    if rc:
        print("Failed to change string!\nOutput error: {0}".format(out))
        sys.exit(1)

def main():
    """
    """
    args = argparser()
    
    try:
        replace_str(args.string1, args.string2, args.path)

    except Exception as e:
        print(str(e))
        sys.exit(1)

if __name__ == "__main__":
    """
    """
    main()