import os

type
    CmdParams* = object
        API_KEY*: string
        DECK_ID*: string
        JP_FIELD_KEY*: string
        TRANSLATION_FIELD_KEY*: string
        CARD_TEMPLATE_ID*: string

if paramCount() < 5:
    echo "ERROR: Usage: kanji_parser_3000 <API_KEY> <DECK_ID> <CARD_TEMPLATE_ID> <JP_FIELD_KEY> <TRANSLATION_FIELD_KEY>"

let cmdParams* = CmdParams(API_KEY: paramStr(1),
                          DECK_ID: paramStr(2),
                          CARD_TEMPLATE_ID: paramStr(3),
                          JP_FIELD_KEY: paramStr(4),
                          TRANSLATION_FIELD_KEY: paramStr(5),
                          )

# log out the object
echo cmdParams