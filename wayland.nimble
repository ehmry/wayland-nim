# Emulate Nimble from CycloneDX data at sbom.json.

import std/json

proc lookupComponent(sbom: JsonNode; bomRef: string): JsonNode =
  for c in sbom{"components"}.getElems.items:
    if c{"bom-ref"}.getStr == bomRef:
      return c
  result = newJNull()

let
  sbom = (getPkgDir() & "/sbom.json").readFile.parseJson
  comp = sbom{"metadata", "component"}
  bomRef = comp{"bom-ref"}.getStr

version = comp{"version"}.getStr
author = comp{"authors"}[0]{"name"}.getStr
description = comp{"description"}.getStr
license = comp{"licenses"}[0]{"license", "id"}.getStr

for prop in comp{"properties"}.getElems.items:
  let (key, val) = (prop{"name"}.getStr, prop{"value"}.getStr)
  case key
  of "nim:skipDirs:":
    add(skipDirs, val)
  of "nim:skipFiles:":
    add(skipFiles, val)
  of "nim:skipExt":
    add(skipExt, val)
  of "nim:installDirs":
    add(installDirs, val)
  of "nim:installFiles":
    add(installFiles, val)
  of "nim:installExt":
    add(installExt, val)
  of "nim:binDir":
    add(binDir, val)
  of "nim:srcDir":
    add(srcDir, val)
  of "nim:backend":
    add(backend, val)
  else:
    if key.startsWith "nim:bin:":
      namedBin[key[8..key.high]] = val

for depend in sbom{"dependencies"}.items:
  if depend{"ref"}.getStr == bomRef:
    for depRef in depend{"dependsOn"}.items:
      let dep = sbom.lookupComponent(depRef.getStr)
      var spec = dep{"name"}.getStr
      for extRef in dep{"externalReferences"}.elems:
        if extRef{"type"}.getStr == "vcs":
          spec = extRef{"url"}.getStr
          break
      let ver = dep{"version"}.getStr
      if ver != "":
        if ver.allCharsInSet {'0'..'9', '.'}: spec.add " == "
        else: spec.add '#'
        spec.add ver
      requires spec
    break
