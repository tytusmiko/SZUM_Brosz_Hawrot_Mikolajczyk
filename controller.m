global ap1 
global bp1 
global cp1
global dp1
global ep1
global fp1 
global ap2 
global bp2 
global cp2
global dp2
global ep2
global fp2 
global al1 
global bl1 
global cl1
global dl1
global el1 
global fl1 
global al2 
global bl2 
global cl2
global dl2
global el2 
global fl2

prawePrzodBiodro(0);
prawePrzodUdo(0);    
prawePrzodPiszczel(0);
praweSrodekBiodro(0);
praweSrodekUdo(0);
praweSrodekPiszczel(0);
leweSrodekBiodro(0);
leweSrodekUdo(0);
leweSrodekPiszczel(0);
lewePrzodBiodro(0);
lewePrzodUdo(0);    
% lewePrzodPiszczel(0);

for i = 1:1:10 
    prawePrzodUdo(-1);
    prawePrzodBiodro(1);
    prawePrzodUdo(0);
    praweSrodekUdo(-1);
    lewePrzodUdo(-1);
    lewePrzodBiodro(-1);
    lewePrzodUdo(0);
    prawePrzodPiszczel(0)
    praweSrodekPiszczel(0);
%     lewePrzodPiszczel(0);
    
    
    praweSrodekBiodro(1);
    
    praweSrodekUdo(0);
   
    praweSrodekPiszczel(-0.2);
    prawePrzodPiszczel(-0.2);
%     lewePrzodPiszczel(-0.2);
    praweSrodekBiodro(-1);
    prawePrzodBiodro(-1);
    lewePrzodBiodro(1);
end

function praweSrodekBiodro(X)
global ap1 
global bp1 
ap1 = rospublisher('/phantomx/j_c1_rm_position_controller/command')      
bp1 = rosmessage(ap1.MessageType)
bp1.Data = X
send(ap1,bp1)
end
function prawePrzodBiodro(X)
global ap2 
global bp2 
ap2 = rospublisher('/phantomx/j_c1_rf_position_controller/command')      
bp2 = rosmessage(ap2.MessageType)
bp2.Data = X
send(ap2,bp2)
end
function praweSrodekUdo(X)
global cp1 
global dp1 
cp1 = rospublisher('/phantomx/j_thigh_rm_position_controller/command')      
dp1 = rosmessage(cp1.MessageType)
dp1.Data = X
send(cp1,dp1)
end
function prawePrzodUdo(X)
global cp2 
global dp2 
cp2 = rospublisher('/phantomx/j_thigh_rf_position_controller/command')      
dp2 = rosmessage(cp2.MessageType)
dp2.Data = X
send(cp2,dp2)
end
function praweSrodekPiszczel(X)
global ep1 
global fp1 
ep1 = rospublisher('/phantomx/j_tibia_rm_position_controller/command')      
fp1 = rosmessage(ep1.MessageType)
fp1.Data = X
send(ep1,fp1)
end
function prawePrzodPiszczel(X)
global ep2 
global fp2 
ep2 = rospublisher('/phantomx/j_tibia_rm_position_controller/command')      
fp2 = rosmessage(ep2.MessageType)
fp2.Data = X
send(ep2,fp2)
end
function leweSrodekBiodro(X)
global al1 
global bl1 
al1 = rospublisher('/phantomx/j_c1_lm_position_controller/command')      
bl1 = rosmessage(al1.MessageType)
bl1.Data = X
send(al1,bl1)
end
function leweSrodekUdo(X)
global cl1 
global cl1 
cl1 = rospublisher('/phantomx/j_thigh_lm_position_controller/command')      
dl1 = rosmessage(cl1.MessageType)
dl.Data = X
send(cl1,dl1)
end
function leweSrodekPiszczel(X)
global el1 
global fl1 
el1 = rospublisher('/phantomx/j_tibia_lm_position_controller/command')      
fl1 = rosmessage(el1.MessageType)
fl1.Data = X
send(el1,fl1)
end

function lewePrzodBiodro(X)
global al2 
global bl2 
al2 = rospublisher('/phantomx/j_c1_lf_position_controller/command')      
bl2 = rosmessage(al2.MessageType)
bl2.Data = X
send(al2,bl2)
end

function lewePrzodUdo(X) 
global cl2 
global dl2 
cl2 = rospublisher('/phantomx/j_thigh_lf_position_controller/command')      
dl2 = rosmessage(cl2.MessageType)
dl2.Data = X
send(cl2,dl2)
end

% function lewePrzodPiszczel(X)
% global el2 
% global fl2 
% el2 = rospublisher('/phantomx/j_tibia_lf_position_controller/command')      
% fl2 = rosmessage(fl2.MessageType)
% fl2.Data = X
% send(el2,fl2)
% end
