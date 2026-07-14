// Reusable rules.
//
// Xlate: attach one translation (given language + content) to an element's
// ^definition via the FHIR translation extension. Call once per language:
//   * insert Xlate(path, nl, "<Dutch>")
//   * insert Xlate(path, fr, "<French>")
// The English text stays as the element's own short/definition.
// Commas and closing parentheses inside the content must be escaped: \, and \)

RuleSet: Xlate(path, lang, content)
* {path} ^definition.extension[+].url = $translation
* {path} ^definition.extension[=].extension[+].url = "lang"
* {path} ^definition.extension[=].extension[=].valueCode = #{lang}
* {path} ^definition.extension[=].extension[+].url = "content"
* {path} ^definition.extension[=].extension[=].valueString = {content}
