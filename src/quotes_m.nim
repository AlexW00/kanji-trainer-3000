import std/[random]

proc getStartQuote*(): string =
    let quotes = @[
        "One does not simply learn kanji",
        "I'm not a teacher, I'm an AUTOMATED KANJI TRAINER with no emotions",
        "Warning: excessive exposure to kanji may cause intense feelings of enlightenment and confusion simultaneously.",
        "Kanji: the reason your handwriting will never be the same again.",
        "Kanji: the art of mastering the stroke of a brush or the click of a keyboard.",
        "Forget about coffee, kanji is the ultimate way to stay up all night and hate yourself in the morning.",
        "I will only stop training you when you are dead.",
        "Don't blame me for the nightmares of kanji strokes haunting you tonight.",
        "Kanji Trainer 3000: making your fingers feel like they just ran a marathon.",
        "Kanji Trainer 3000: where mistakes are not an option. Unless you enjoy punishment.",
        "Kanji Trainer 3000: where you'll finally understand why your Japanese teacher had a permanent scowl on their face.",
    ]
    return quotes[rand(quotes.len - 1)]

proc getEndQuote*(): string =
    let quotes = @[
        "Congratulations! You are now officially a kanji master. Just don't ask me to read your handwriting.",
        "Thank you for using Kanji Trainer 3000. Please take a break, go outside, and get some sun. Your pasty fingers will thank you.",
        "You've learned so many kanji, you could write a whole novel. Too bad no one will be able to read it.",
        "Kanji Trainer 3000: now you know why Japanese calligraphy is a respected art form. Your handwriting, on the other hand, is not.",
        "You're done for the day! Unless you're a masochist, in which case feel free to keep going.",
        "Congrats! You've learned enough kanji to impress your Japanese friends. Just don't try to write their names.",
        "You did it! You've achieved kanji enlightenment. Now you just need to figure out how to use it in real life.",
        "Thanks for using Kanji Trainer 3000. I hope you enjoyed the torture, er, ) mean training."
    ]
    return quotes[rand(quotes.len - 1)]
