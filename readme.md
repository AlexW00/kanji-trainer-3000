# 🀄️ --- KANJI TRAINER 3000 --- 🀄️

A simple cmd line tool to help you practice kanjis from your Mochi cards.

### Usage

1. Download the latest release from [here]()
2. Run the executable: `kanji-trainer-3000 <API_KEY> <DECK_ID> <CARD_TEMPLATE_ID> <JP_FIELD_KEY> <TRANSLATION_FIELD_KEY>`
   - `API_KEY`: Your Mochi API key
   - `DECK_ID`: The id of the deck to pull cards from
   - `CARD_TEMPLATE_ID`: The id of the card template the cards should be based on
   - `JP_FIELD_KEY`: The key of the field containing the japanese text
   - `TRANSLATION_FIELD_KEY`: The key of the field containing the translation
3. PRACTICE YOUR KANJIS!!
   - to quit: `i lost` or `ctrl + c`

Example usage:

```bash
# yeah, these ids and keys are really cryptic but you can find yours in the Mochi App
kanji-trainer-3000 1234567890abcdef 82ZkbK4h yk3E2O3Z IRd8fevy 2Q3Z2Q3Z
```
