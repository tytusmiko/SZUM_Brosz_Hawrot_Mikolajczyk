function leweSrodekPiszczel(X)
 kl = rospublisher('/phantomx/j_tibia_lm_position_controller/command')      
 ll = rosmessage(kl.MessageType)
ll.Data = X
send(kl,ll)
end