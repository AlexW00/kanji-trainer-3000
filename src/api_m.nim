import std/[asyncdispatch, httpclient, base64, json]
import cmd_params_m
import card_stack_m

const MOCHI_BASE_URL = "https://app.mochi.cards/api/"
const CARDS_ENDPOINT = MOCHI_BASE_URL & "cards"

type
    ApiResult*[T] = object
        result*: T
        bookmark*: string

proc auth(client: AsyncHttpClient) = 
    client.headers["Authorization"] = "Basic " & base64.encode(cmdParams.API_KEY & ":")

proc getCardsFromDeck*(deck: string, bookmark: string): Future[ApiResult[CardStack]] {.async.} =
    echo "Getting cards..."
    let url = CARDS_ENDPOINT & "?limit=99" & "?deck-id=" & deck & (if bookmark != "": "&bookmark=" & bookmark else: "")
    let client = newAsyncHttpClient()
    auth(client)
    let response = await client.getContent(url)
    let json = parseJson(response)
    let cards = parseCards(json["docs"])
    client.close()
    let apiResult = ApiResult[CardStack](result: cards, bookmark: json["bookmark"].getStr)
    return apiResult

proc getAllCardsFromDeck*(deck: string, bookmark: string): Future[CardStack] {.async.} =
    var cards: CardStack = @[]
    var apiResult = await getCardsFromDeck(deck, bookmark)
    cards.add(apiResult.result)
    while apiResult.bookmark != "":
        let newResult = await getCardsFromDeck(deck, apiResult.bookmark)
        if newResult.bookmark != apiResult.bookmark:
            cards.add(apiResult.result)
            apiResult = newResult
        else:
            break
    return cards