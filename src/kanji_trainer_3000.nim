import std/[asyncdispatch]

import cmd_params_m
import api_m



proc main() {.async.} =
    let bm = ""
    let cardsResult = await getAllCardsFromDeck(cmdParams.DECK_NAME, bm)


when isMainModule:
    waitFor main()