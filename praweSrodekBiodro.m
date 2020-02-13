function praweSrodekBiodro(X)
gp = rospublisher('/phantomx/j_c1_rm_position_controller/command')      
hp = rosmessage(gp.MessageType)
hp.Data = X
send(gp,hp)
end
