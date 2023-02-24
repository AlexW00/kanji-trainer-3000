import std/[json]
import card_m
import text_m

type CardStack* = seq[Card]

proc parseCards*(json: JsonNode): CardStack =
    var cards: seq[Card]
    for card in json:
        if doParseCard(card):
            cards.add parseCard(card)
    return cards

proc filterKanjiCards*(cards: CardStack): CardStack =
    var kanjiCards: seq[Card]
    for card in cards:
        if hasKanji(card.japanese):
            kanjiCards.add card
    return kanjiCards