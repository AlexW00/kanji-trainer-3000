import std/[asyncdispatch]

import cmd_params_m
import api_m
import quiz_m
import std/random



proc main() {.async.} =
    let bm = ""
    let cardsResult = await getCardsFromDeck(cmdParams.DECK_NAME, bm)
    var cards = cardsResult.result
    # shuffle sequence
    randomize()
    shuffle(cards)
    # take first 5 cards
    cards = cards[0..4]
    echo "cards: ", cards.len
    var quiz = newQuiz(cards)
    startQuiz(quiz)

when isMainModule:
    waitFor main()