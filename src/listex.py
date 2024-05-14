'''Read a TeX .fls file and produce a consolidated, deduplicated list of the
files involved.  Optionally check for MP source files as well'''

import argparse
import pathlib
import sys


def get_files_from_fls(f, want_all):
    '''resolve the names in the recorded list of files
       and return a deduplicated, sorted list
    '''
    pwd = None
    files = []
    for line in f.read_text().splitlines():
        key, name = line.split(None, 1)
        if key == "PWD":
            pwd = pathlib.Path(name)
            continue

        if name.startswith("."):
            f = pwd / name
        elif want_all:
            f = pathlib.Path(name)
        else:
            continue

        f = f.resolve()

        if not f.is_file():
            continue

        if f.suffix in ('.aux', '.toc', '.log', '.maf'):
            continue

        if f.suffix.startswith('.mtc'):
            continue

        files.append(f)

    return sorted(set(files))


def get_source_files_for_pdfs(files):
    '''Heuristically find the MP source for a PDF
    '''
    mp_source = []
    for p in files:
        # only PDFs...
        if p.suffix != '.pdf':
            continue

        # but not the main PDF
        if p.name == file_record.with_suffix('.pdf').name:
            continue

        pdfbytes = p.read_bytes()

        if b'LuaTeX' in pdfbytes:
            mp = p.with_suffix('.mp')
            tex = p.with_suffix('.tex')
            if mp.is_file():
                mp_source.append(mp)
            elif tex.is_file():
                mp_source.append(tex)
            else:
                print(f'No source found for {p} (Luatex)', file=sys.stderr)

        elif b'MetaPost' in pdfbytes:
            mp_multi = pathlib.Path(p.stem[:-1]).with_suffix('.mp')
            mp_single = p.with_suffix('.mp')
            if mp_multi.is_file():
                mp_source.append(mp_multi)
            elif mp_single.is_file():
                mp_source.append(mp_single)
            else:
                print(f'No source found for {p} (Plain MP)', file=sys.stderr)

        else:
            print(f'No source found for {p} (??)', file=sys.stderr)

    mp_includes = []
    for f in mp_source:
        for line in f.read_text().splitlines():
            if line.startswith("input "):
                mp = f.with_stem(line.split()[1])
                if mp.is_file():
                    mp_includes.append(mp)

    return sorted(set(mp_source + mp_includes))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("file_record", help="TeX .FLS file")
    parser.add_argument("--all", action="store_true",
                        help="Also files from /texmf")
    parser.add_argument("--mp", action="store_true",
                        help="Also MP source files ")
    args = parser.parse_args()

    file_record = pathlib.Path(args.file_record).with_suffix(".fls")
    # using with_suffix allows you to default to the tex name or no extension
    # at all

    if not file_record.is_file():
        print("Cannot see", file_record, file=sys.stderr)
        sys.exit(1)

    file_record_mtime = file_record.stat().st_mtime

    files = get_files_from_fls(file_record, args.all)
    if args.mp:
        files.extend(get_source_files_for_pdfs(files))

    files = sorted(set(files))

    need_to_recompile = False
    for f in files:
        if f.suffix in ('.tex', '.mp'):
            if f.stat().st_mtime > file_record_mtime:
                print(f, "has been updated since .FLS was created",
                      file=sys.stderr)
                need_to_recompile = True

    if need_to_recompile:
        print("Please recompile with -recorder", file=sys.stderr)
        sys.exit(1)

    for f in files:
        print(f)
