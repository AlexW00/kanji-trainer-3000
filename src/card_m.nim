import std/[json]
import cmd_params_m

type
    Card* = object
        id: string
        japanese: string
        translation: string

proc isOfCardTemplate*(json: JsonNode): bool =
    return json.hasKey("template-id") and json["template-id"].getStr == cmdParams.CARD_TEMPLATE_ID

proc isParseableCard*(json: JsonNode): bool =
    if not json.hasKey("fields"):
        return false
    let fields = json["fields"]
    return fields.hasKey(cmdParams.JP_FIELD_KEY) and fields.hasKey(cmdParams.TRANSLATION_FIELD_KEY)

proc doParseCard*(json: JsonNode): bool =
    return isOfCardTemplate(json) and isParseableCard(json)

# parse json card to Card object
proc parseCard*(json: JsonNode): Card =
    let fields = json["fields"]
    Card(
        id: json["id"].getStr,
        japanese: fields[cmdParams.JP_FIELD_KEY]["value"].getStr,
        translation: fields[cmdParams.TRANSLATION_FIELD_KEY]["value"].getStr
    )
