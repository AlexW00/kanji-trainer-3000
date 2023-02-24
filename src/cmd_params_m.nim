import os

type
    CmdParams* = object
        API_KEY*: string
        DECK_NAME*: string
        JP_FIELD_KEY*: string
        TRANSLATION_FIELD_KEY*: string
        CARD_TEMPLATE_ID*: string


if paramCount() < 6:
    echo "ERROR: Usage: kanji_parser_3000 <API_KEY> <DECK_NAME> <JP_FIELD_KEY> <TRANSLATION_FIELD_KEY> <CARD_TEMPLATE_ID>"

let cmdParams* = CmdParams(API_KEY: paramStr(1),
                          DECK_NAME: paramStr(2),
                          JP_FIELD_KEY: paramStr(3),
                          TRANSLATION_FIELD_KEY: paramStr(4),
                          CARD_TEMPLATE_ID: paramStr(5))

# log out the object
echo cmdParams