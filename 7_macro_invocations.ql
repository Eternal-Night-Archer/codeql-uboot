import cpp

from Macro m, MacroInvocation m_invoc
where
    m.getName() in ["ntohs", "ntohl", "ntohll"]
    and m_invoc.getMacro() = m
select m, m_invoc, "network data access macro invoked"
