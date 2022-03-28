import cpp

from Macro m, MacroInvocation m_invoc, Expr expr
where
    m.getName() in ["ntohs", "ntohl", "ntohll"]
    and m_invoc.getMacro() = m
    and m_invoc.getExpr() = expr
select expr, "network data access expression"
