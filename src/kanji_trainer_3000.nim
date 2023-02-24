import std/[asyncdispatch]

import cmd_params_m
import api_m
import card_stack_m



proc main() {.async.} =
    let bm = ""
    let cardsResult = await getCardsFromDeck(cmdParams.DECK_NAME, bm)
    let kanjiCards = filterKanjiCards(cardsResult.result)
    for card in kanjiCards:
        echo card.japanese


when isMainModule:
    waitFor main()