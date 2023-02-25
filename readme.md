# 🀄️ --- KANJI TRAINER 3000 --- 🀄️

A simple cmd line tool to help you practice kanjis from your Mochi cards. (for private use)

https://user-images.githubusercontent.com/55558407/221328071-481de8a4-7802-4bd5-8b4f-81e695720026.mp4

### What does it do?

- It extracts all sentences/words with at least one kanji in it from a deck of your choice
- It removes all furigana and prompts you to write out the sentence/word in hiragana
- The cycle continues on forever until you got all prompts right

### Running

1. Install [Nim](https://nim-lang.org/) (if someone is actually insterested in using this, I'll make a binary release)
2. Run the executable: `nim c -r -d:ssl -o:bin/kanji_trainer_3000 <API_KEY> <DECK_ID> <CARD_TEMPLATE_ID> <JP_FIELD_KEY> <TRANSLATION_FIELD_KEY>`
   - `API_KEY`: Your Mochi API key
   - `DECK_ID`: The id of the deck to pull cards from
   - `CARD_TEMPLATE_ID`: The id of the card template the cards should be based on
   - `JP_FIELD_KEY`: The key of the field containing the japanese text
   - `TRANSLATION_FIELD_KEY`: The key of the field containing the translation
3. PRACTICE YOUR KANJIS!!
   - to quit: `i lost` or `ctrl + c`
