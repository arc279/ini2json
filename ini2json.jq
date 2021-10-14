#!/usr/bin/env jq -Rs -f

def sectionToEntry:
  split("\n")
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
    .|gsub("\\s*=\\s*"; "=")  # section values
  end
;

split("\n")
| ["\fglobal", .[]|formatSection]
| join("\n")
| split("\f")
| map(select(length > 0) | sectionToEntry)
| reduce .[] as $x ({}; . + $x)
| if .global == {} then del(.global) else . end
