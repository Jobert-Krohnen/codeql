import java
import semmle.code.java.security.JexlInjectionQuery
import TestUtilities.InlineExpectationsTest

class JexlInjectionTest extends InlineExpectationsTest {
  JexlInjectionTest() { this = "HasJexlInjectionTest" }

  override string getARelevantTag() { result = "hasJexlInjection" }

  override predicate hasActualResult(Location location, string element, string tag, string value) {
    tag = "hasJexlInjection" and
    exists(DataFlow::Node sink | JexlInjectionFlow::flowTo(sink) |
      sink.getLocation() = location and
      element = sink.toString() and
      value = ""
    )
  }
}
