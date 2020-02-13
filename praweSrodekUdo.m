function praweSrodekUdo(X)
 ep = rospublisher('/phantomx/j_thigh_rm_position_controller/command')      
 fp = rosmessage(ep.MessageType)
fp.Data = X
send(ep,fp)
end