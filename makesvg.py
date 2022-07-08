#! /usr/bin/env python3

import argparse
import collections
import fileinput
import pathlib
import subprocess

Ignore_lines = []
Ignore_lines.append(r"\documentclass[border=5mm]{standalone}")
Ignore_lines.append(r"\documentclass{standalone}")
Ignore_lines.append(r"\usepackage{luamplib}")
Ignore_lines.append(r"\begin{document}")
Ignore_lines.append(r"\end{document}")
Ignore_lines.append(r"\mplibtextextlabel{enable}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("files", nargs="*")
    parser.add_argument("--keep", action="store_true", help="Keep intermediate files.")
    parser.add_argument("--scale", type=int, default=4, help="Set ppi to 72 * n")
    parser.add_argument("--format", choices=["png", "svg"], default="png", help="PNG or SVG")
    args = parser.parse_args()

    for file in args.files:
        stem = pathlib.Path(file).stem
        state = "PRE"
        wanted = collections.defaultdict(list)
        for line in fileinput.input(files=file):
            line = line.strip()
            this = "SKIP"
            if line == r"\begin{mplibcode}":
                state = "FIG"
            elif line == r"\end{mplibcode}":
                state = "END"
            elif line in Ignore_lines:
                pass
            elif not line:
                pass
            else:
                this = "USE"
           
            if this == "USE":
                if "label" in line:
                    line = line.replace('("', '(TEX("')
                    line = line.replace('",', '"),')
                wanted[state].append(line)

        mpfile = pathlib.Path(stem + f'-{args.format}-version.mp')
        with open(mpfile, 'w') as out:
            print(f'''prologues := 3; outputtemplate := "{pathlib.Path(file).with_suffix(f'.{args.format}')}";''', file=out)
            print(f'''outputformat := "{args.format}";''', file=out)
            if args.format == 'png':
                print(f'''hppp := 1/{args.scale}; vppp := 1/{args.scale};''', file=out)
            print( '''input TEX''', file=out)
            print(f'''TEXPRE("%&latex" & char(10) & "\\documentclass{{article}}{' '.join(wanted['PRE'])}\\begin{{document}}");''', file=out)
            print( '''TEXPOST("\\end{document}");''', file=out)
            print('''\n'''.join(wanted['FIG']), file=out)
            print('''end.''', file=out)

        cp = subprocess.run(['mpost', mpfile])
        if cp.returncode == 0 and not args.keep:
            mpfile.unlink()
            mpfile.with_suffix('.log').unlink()
            pathlib.Path("mptextmp.mp").unlink()
            pathlib.Path("mptextmp.mpx").unlink()




