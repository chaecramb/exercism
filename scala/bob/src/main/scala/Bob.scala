class Bob {
  val Responses = Map(
    'shouting -> "Whoa, chill out!",
    'silence -> "Fine. Be that way!",
    'question -> "Sure.",
    'other -> "Whatever."
  )

  def hey(speech: String): String = Responses(SpeechParser.typeOfSpeech(speech))
}

object SpeechParser {
  def typeOfSpeech(speech: String): Symbol = {
    if (isShouting(speech))
      'shouting
    else if (isSilence(speech))
      'silence
    else if (isQuestion(speech))
      'question
    else
      'other
  }

  private def isShouting(phrase: String): Boolean = {
    phrase == phrase.toUpperCase && phrase.exists(_.isLetter)
  }

  private def isSilence(phrase: String): Boolean = {
    phrase.trim.isEmpty
  }

  private def isQuestion(phrase: String): Boolean = {
    phrase.endsWith("?")
  }
}