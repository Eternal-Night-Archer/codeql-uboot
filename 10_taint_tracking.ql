import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetWorkByteSwap extends Expr {
    NetWorkByteSwap() {
        exists(Macro m, MacroInvocation m_invoc |
            m.getName() in ["ntohs", "ntohl", "ntohll"]
            and m_invoc.getMacro() = m
            and m_invoc.getExpr() = this
        )
    }
}

class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  override predicate isSource(DataFlow::Node source) {
    source.asExpr() instanceof NetWorkByteSwap
  }
  override predicate isSink(DataFlow::Node sink) {
      exists(FunctionCall call |
        call.getTarget().getName() = "memcpy"
        and sink.asExpr() = call.getArgument(2)
      )
  }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"