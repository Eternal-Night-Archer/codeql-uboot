import cpp

from Macro macro
where macro.getName() in ["ntohs", "ntohl", "ntohll"]
select macro, "a macro related to network data"