function leweSrodekBiodro(X)
cl = rospublisher('/phantomx/j_c1_lm_position_controller/command')      
dl = rosmessage(cl.MessageType)
 dl.Data = X
send(cl,dl)
end

