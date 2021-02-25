# St. Lawrence Island digital corpus

**This resource is part of the linguistic and cultural heritage of the St. Lawrence Island Yupik people. By accessing this resource, you agree to treat this resource, the St. Lawrence Island Yupik language, the St. Lawrence Island Yupik culture, and the St. Lawrence Island Yupik people with dignity and respect. If you do not agree to these conditions, you may not access this resource and you may not make copies of this resource.**

If you agree to these conditions, you may access this resource under the terms of the Creative Commons Attribution No-Commercial 4.0 license (https://creativecommons.org/licenses/by-nc/4.0/).


## Version

This is the development version of the St. Lawrence Island Yupik digital corpus.

This version incorporates changes made after the release of version 0.1.0 on 31 January 2021.


## Tokenization Status

- Content in the ess directory has been tokenized through a combination of automated and manual means.
- Content in other directories has not been tokenized.


## Character histogram

Run `make ess.character_histogram` to obtain a histogram of the characters in the Yupik corpus.

## Video

A video description of this corpus is available at https://www.youtube.com/watch?v=Vf2DD-36oxs

## Conventions

- Double-quotation marks 
  - Use LEFT DOUBLE QUOTATION MARK (U+201C) for opening double quotation marks
  - Use RIGHT DOUBLE QUOTATION MARK (U+201D) for closing double quotation marks
  - Do not use QUOTATION MARK (U+0022)

- Single-quotation marks
  - Use LEFT SINGLE QUOTATION MARK (U+2018) for opening single quotation marks
  - Use RIGHT SINGLE QUOTATION MARK (U+2019) for closing single quotation marks
  - Use MODIFIER LETTER APOSTROPHE (U+02BC) for any single quote or apostrophe that occurs within a word
    - Yupik example: Qafsinʼguniikaat
    - English example: whatʼs
  - Do not use APOSTROPHE (U+0027)
  
- Ellipsis
  - Use HORIZONTAL ELLIPSIS (U+2026)
  - Do not use a sequence of multiple FULL STOP characters (U+002E)
    - If this occurs as formatting (for example in a table of contents), delete it
    - If this occurs as an ellipsis in text, replace it with HORIZONTAL ELLIPSIS character (U+2026)

- Dashes (hyphen-minus)
  - You may use HYPHEN-MINUS (U+002D) within a word
  - Do not use a sequence of HYPHEN-MINUS characters (U+002D)
    - If this occurs as formatting (for example in a table of contents), delete it
    - If this occurs within a word or between words, replace it with a single HYPHEN-MINUS character (U+002D)

- Underscore (low line)
  - The LOW LINE character (U+005F) may be used to represent a blank (for example in a fill-in-the-blank worksheet)
    - In such cases, use a *single* LOW LINE character (U+005F) to represent each blank
  - If the LOW LINE character (U+005F) occurs as formatting (for example in a table of contents), delete it

- Colon
  - The COLON character (U+003A) should always be preceded by a single space and followed by the end of line or a single space
    - In nearly all cases a COLON character (U+003A) should be immediately followed by the end of line.

- Numeric lists
  - For numeric lists that include a period after the number, the format should be as follows:
    - Number followed by space followed by the period (if there is one) followed by a newline

- Section sign
  - Use SECTION SIGN (U+00A7) to mark start of a Bible verse.

- Whitespace
  - The CARRIAGE RETURN character (U+000D) should not be used.
  - Each line should end with a single LINE FEED (LF) character (U+000A)
  - Between paragraphs there should be a blank line, consisting only of a single LINE FEED (LF) character (U+000A)
  - The CHARACTER TABULATION (tab) character (U+0009) should not be used.
    - If a tab occurs as part of formatting, it should be either deleted, replaced with a single SPACE character (U+0020), or replaced with a single LINE FEED (LF) character (U+000A)
  - There should never be multiple SPACE (U+0020) characters in sequence. If this happens, replace with a single SPACE character (U+0020).
  - There should never be a SPACE (U+0020) character at the beginning or end of a line. If this happens, delete it.

- Scanning errors
  - Whenever it is not possible to determine the correct identity of a character (usually because of scanning errors), do your best to estimate the number of missing characters, and replace each one with the following:
    - WHITE SQUARE (U+25A1)

- Punctuation should generally be isolated by whitespace, with the following exceptions:
  - These two characters may be used within a word:
    - MODIFIER LETTER APOSTROPHE (U+02BC)
    - HYPHEN-MINUS (U+002D)
  - This character may be used at the beginning of a monetary expression if immediately followed by a digit
    - DOLLAR SIGN (U+0024)
  - This character may be used as part of a monetary or numeric expression to separate two digits:
    - COMMA (U+002C)
  - This character may be used as part of a monetary or numeric expression as a decimal point:
    - FULL STOP (U+002E)
  - This character may be used as part of an abbreviation:
    - FULL STOP (U+002E)
    
  
