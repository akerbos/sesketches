// Raphael Reitzig, 2012.
// MIT license
// Best with Scala 2.9.x

val N = 3
val M = 5
val runs = 10000

def oneRun(N : Int, M : Int) : Seq[Int] = {
  val targets = (1 to M) map { _ => scala.util.Random.nextInt(N)  }
  val counts = (0 until N) map { n => (targets count ( _ == n )) }
  counts
}

def manyRuns(N : Int, M : Int, runs : Int) = {
  val targetSample = (1 to runs) map { _ => oneRun(N,M).head }
  (0 to M) map { c => targetSample.count ( c == _ ) / (runs : Double) }
}

def factorial(n : Int) : Double = {
  n match {
    case 0 => 1.0
    case n => n*factorial(n-1)
  }
}

def probability(M : Int, m : Int) : Double = {
  import math._
  round(100000 * (factorial(M) / (factorial(m) * factorial(M-m))) * pow(1.0/N,m) * pow(1.0 - (1.0/N),M-m)) / 100000.0
}

val pred = ((0 to M) map (probability(M,_)))
val meas = manyRuns(N,M,runs)

println("Predicted:\t" + pred)
println("Measured:\t" + meas)
println("Quadratic error: " + ((0 until pred.size) map { i => (pred(i) - meas(i))*(pred(i) - meas(i)) }).sum)
