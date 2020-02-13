function leweSrodekUdo(X)
 il = rospublisher('/phantomx/j_thigh_lm_position_controller/command')      
 jl = rosmessage(il.MessageType)
jl.Data = X
send(il,jl)
end