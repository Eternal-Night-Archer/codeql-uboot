import cpp

from Function func, FunctionCall func_call
where
    func.getName() = "memcpy"
    and func_call.getTarget() = func
select func_call, "call memcpy"
