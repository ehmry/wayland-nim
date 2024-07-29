#! /usr/bin/env -S jq --raw-output --from-file
.metadata.component.properties as $props |
$props |
  ( map( select(.name | .[0:10] == "nim:binDir") ) +
    map( select(.name | .[0:10] == "nim:srcDir") ) |
    map( .value )
  ) + ["."] | .[0] as $binDir |

$props |
  map( select(.name | .[0:8] == "nim:bin:") ) |
  map( ": \($binDir)/\(.value).nim |> !nim_bin |> $(BIN_DIR)/\(.name[8:]) {bin}" ) |
  join("\n")
