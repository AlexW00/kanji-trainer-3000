# index.nim
import std/[asyncdispatch, httpclient, base64, json]
# import all from module card
import card_m
import card_stack_m
import cmd_params_m

# HTTP Basic Auth
const MOCHI_BASE_URL = "https://app.mochi.cards/api/"
const CARDS_ENDPOINT = MOCHI_BASE_URL & "cards"

proc auth(client: AsyncHttpClient) = 
    client.headers["Authorization"] = "Basic " & base64.encode(cmdParams.API_KEY & ":")

proc getCardsFromDeck(deck: string): Future[CardStack] {.async.} =
    let url = CARDS_ENDPOINT & "?limit=99" & "?deck-id=" & deck
    let client = newAsyncHttpClient()
    auth(client)
    let response = await client.getContent(url)
    echo response
    # get json body
    let json = parseJson(response)
    let cards = parseCards(json["docs"])
    client.close()
    return cards

proc main() {.async.} =
    let cards = await getCardsFromDeck(cmdParams.DECK_NAME)
    echo "cards: " & $cards.len
    for card in cards:
        echo "card: " & $card

when isMainModule:
    waitFor main()