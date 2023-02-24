import std/[asyncdispatch]

import cmd_params_m
import api_m


proc main() {.async.} =
    let cards = await getCardsFromDeck(cmdParams.DECK_NAME)
    echo "cards: " & $cards.len
    for card in cards:
        echo "card: " & $card

when isMainModule:
    waitFor main()