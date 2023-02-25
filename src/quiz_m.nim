import card_stack_m
import card_m
import std/options
import text_m
import quotes_m

type
    Quiz* = object
        startCards: CardStack
        completedCards: CardStack
        falseCards: CardStack
        totalReviewed: int

proc nextCard*(quiz: var Quiz): Option[Card] =
    if quiz.startCards.len > 0:
        let card = quiz.startCards[0]
        quiz.startCards.delete(0)
        quiz.totalReviewed += 1
        return some(card)
    elif quiz.falseCards.len > 0:
        let card = quiz.falseCards[0]
        quiz.falseCards.delete(0)
        quiz.totalReviewed += 1
        return some(card)
    else:
        return none(Card)

proc answerCard*(quiz: var Quiz, card: Card, correct: bool) =
    if correct:
        quiz.completedCards.add(card)
    else:
        quiz.falseCards.add(card)     

proc newQuiz*(cards: CardStack): Quiz =
    let kanjiCards = filterKanjiCards(cards)
    let noLinkCards = filterNoLinkCards(kanjiCards)
    return Quiz(
        startCards: noLinkCards,
        completedCards: newCardStack(),
        falseCards: newCardStack(),
        totalReviewed: 0
    )

proc getFinalStats*(quiz: Quiz): string =
    let totalCards = quiz.completedCards.len + quiz.falseCards.len
    let percentCorrect = totalCards / quiz.totalReviewed
    return "--- FINAL STATS ---" & "\n" &
        "Total cards: " & $totalCards & "\n" &
        "Answers: " & $quiz.totalReviewed & "\n" &
        "Percentage: " & $percentCorrect & "%"

proc startQuiz*(quiz: var Quiz) =
    echo "🀄️ --- KANJI TRAINER 3000 --- 🀄️" & "\n"
    echo "> " & getStartQuote() & "\n"
    while true:
        let card = nextCard(quiz)
        if card.isNone:
            break
        else:
            let kanji = card.get.japanese.removeFurigana()
            let furigana = card.get.japanese.removeKanji()
            echo "Kanji: " & kanji
            stdout.write("Furigana: ")
            let answer = readLine(stdin)
            if answer == furigana:
                echo "✅" & "\n"
                answerCard(quiz, card.get, true)
            else:
                echo "❌ '" & answer & "' != '" & furigana & "'"  & "\n"
                answerCard(quiz, card.get, false)
    
    echo getFinalStats(quiz) & "\n"
    echo "> " & getEndQuote()

