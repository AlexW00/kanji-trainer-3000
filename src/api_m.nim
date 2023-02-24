import std/[asyncdispatch, httpclient, base64, json]
import cmd_params_m
import card_stack_m

const MOCHI_BASE_URL = "https://app.mochi.cards/api/"
const CARDS_ENDPOINT = MOCHI_BASE_URL & "cards"

proc auth(client: AsyncHttpClient) = 
    client.headers["Authorization"] = "Basic " & base64.encode(cmdParams.API_KEY & ":")

proc getCardsFromDeck*(deck: string): Future[CardStack] {.async.} =
    let url = CARDS_ENDPOINT & "?limit=99" & "?deck-id=" & deck
    let client = newAsyncHttpClient()
    auth(client)
    let response = await client.getContent(url)
    let json = parseJson(response)
    let cards = parseCards(json["docs"])
    client.close()
    return cards