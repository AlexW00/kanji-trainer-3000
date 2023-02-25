import std/[strutils, unicode, re]


# Kanji ( 4e00 - 9faf)
proc isKanji*(c: Rune): bool =
    return c.uint32 >= 0x4E00'u32 and c.uint32 <= 0x9FAF'u32

# Hiragana ( 3040 - 309f)
proc isHiragana*(c: Rune): bool =
    return c.uint32 >= 0x3040'u32 and c.uint32 <= 0x309F'u32

# Katakana ( 30a0 - 30ff)
proc isKatakana*(c: Rune): bool =
    return c.uint32 >= 0x30A0'u32 and c.uint32 <= 0x30FF'u32


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

proc removeKanji*(s: string): string =
    result = ""
    let runes = s.toRunes()
    for c in runes:
        if c.isHiragana or c.isKatakana:
            result.add(c)
    return result


proc hasKanji*(s: string): bool =
    let runes = s.toRunes()
    for c in runes:
        if isKanji(c):
            return true
    return false