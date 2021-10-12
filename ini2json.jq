#!/usr/bin/env jq -Rs -f

def sectionToEntry:
  split("\n")[:-1]
    | map(select(length>0))
    | {
      (.[0]): .[1:] | map(
          split("=") | { key: .[0], value:.[1] }
        ) | from_entries
    }
;

def formatSection:
  if startswith("[") and endswith("]") then
    ["\f", .]|join("")  # separator + section name
  else
    .|gsub(" = "; "=")  # section values
  end
;

split("\n")[:-1]
| map(formatSection)
| join("\n")
| split("\f")
| map(select(length > 0) | sectionToEntry)
