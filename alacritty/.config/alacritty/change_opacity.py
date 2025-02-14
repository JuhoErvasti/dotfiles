#!/bin/python3

import sys

def main() -> None:
    try:
        value = sys.argv[1]
    except IndexError:
        print("ERROR: No opacity value given")
        return

    try:
        num_value: int = int(value)
    except Exception:
        print(f"ERROR: Could not convert {value} into a int!")
        return

    if num_value < 0:
        print("ERROR: Opacity can't be below zero!")
        return

    if num_value > 100:
        print("ERROR: Opacity can't be above 100%!")
        return

    lines: list[str] = []
    with open("alacritty.toml", "r") as file:
        lines = file.read().splitlines(True)
        for i, line in enumerate(lines):
            if "opacity = " in line:
                lines[i] = f"opacity = {float(num_value / 100)}\n"

    with open("alacritty.toml", "w") as file:
        file.writelines(lines)

if __name__ == "__main__":
    main()
