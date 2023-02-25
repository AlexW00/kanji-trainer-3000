import std/[asyncdispatch]

import cmd_params_m
import api_m
import quiz_m
import std/random



proc main() {.async.} =
    let bm = ""
    # todo: get more 
    let cardsResult = await getCardsFromDeck(cmdParams.DECK_ID, bm)
    var cards = cardsResult.result

    randomize()
    shuffle(cards)

    var quiz = newQuiz(cards)
    startQuiz(quiz)

when isMainModule:
    waitFor main()