/**
  * Created by chaecramb on 04/08/2016.
  */

object Hamming {
  def compute(strand1: String, strand2: String): Int = {
    require (strand1.length == strand2.length, "Strands must be of the same length") 
    strand1.zip(strand2).count(nucs => nucs._1 != nucs._2)
  }
}

