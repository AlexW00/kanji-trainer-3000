import std/[strutils, unicode, re]

proc removeFurigana*(s: string): string =
    result = ""
    var isFurigana = false
    for c in s:
        if c == '(':
            isFurigana = true
        elif c == ')':
            isFurigana = false
        elif not isFurigana:
            result.add(c)
    return result

proc isKanji*(c: Rune): bool =
    return c.uint32 >= 0x4E00'u32 and c.uint32 <= 0x9FFF'u32

proc hasKanji*(s: string): bool =
    let runes = s.toRunes()
    for c in runes:
        if isKanji(c):
            return true
    return false