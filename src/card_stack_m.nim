import std/[json]
import card_m

type CardStack* = seq[Card]

proc parseCards*(json: JsonNode): CardStack =
    var cards: seq[Card]
    for card in json:
        if doParseCard(card):
            cards.add parseCard(card)
    return cards