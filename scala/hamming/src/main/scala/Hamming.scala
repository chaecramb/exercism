/**
  * Created by chaecramb on 04/08/2016.
  */

object Hamming {
  def compute(strand1: String, strand2: String): Int = {
    def countDifferences(diff: Int, nucs: (Char, Char)) = if (nucs._1 == nucs._2) diff else diff + 1

    if (strand1.length != strand2.length) throw new IllegalArgumentException
    strand1.zip(strand2).foldLeft(0)(countDifferences)
  }
}

