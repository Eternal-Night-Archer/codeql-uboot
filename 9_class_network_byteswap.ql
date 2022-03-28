import cpp

class NetWorkByteSwap extends Expr {
    NetWorkByteSwap() {
        exists(Macro m, MacroInvocation m_invoc |
            m.getName() in ["ntohs", "ntohl", "ntohll"]
            and m_invoc.getMacro() = m
            and m_invoc.getExpr() = this
        )
    }
}

from NetWorkByteSwap n
select n, "Network Byte Swap Macro Invocation"
