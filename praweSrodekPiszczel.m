function praweSrodekPiszczel(X)
 ap = rospublisher('/phantomx/j_tibia_rm_position_controller/command')      
 bp = rosmessage(ap.MessageType)
bp.Data = X
send(ap,bp)
end