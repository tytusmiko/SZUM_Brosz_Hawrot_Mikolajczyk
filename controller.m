global ap1 ;
global bp1 ;
global cp1 ;
global dp1 ;
global ep1 ;
global fp1 ;
global ap2 ;
global bp2 ;
global cp2 ;
global dp2 ;
global ep2 ;
global fp2 ;
global ap3 ;
global bp3 ;
global cp3 ;
global dp3 ;
global ep3 ;
global fp3 ;
global al1 ;
global bl1 ;
global cl1 ;
global dl1 ;
global el1 ;
global fl1 ;
global al2 ;
global bl2 ;
global cl2 ;
global dl2 ;
global el2 ;
global fl2 ;
global al3 ;
global bl3 ;
global cl3 ;
global dl3 ;
global el3 ;
global fl3 ;

prawePrzodBiodro(0);
prawePrzodUdo(0);    
prawePrzodPiszczel(0);
praweSrodekBiodro(0);
praweSrodekUdo(0);
praweSrodekPiszczel(0);
praweTylBiodro(0);
praweTylUdo(0);    
praweTylPiszczel(0);

lewePrzodBiodro(0);
lewePrzodUdo(0);    
lewePrzodPiszczel(0);
leweSrodekBiodro(0);
leweSrodekUdo(0);
leweSrodekPiszczel(0);
leweTylBiodro(0);
leweTylUdo(0);    
leweTylPiszczel(0);
%%
A=0.7;
B=1;
C=0;
for i = 1:1:10
    % nogi gora
    prawePrzodUdo(-B);
    praweTylUdo(-B);
    leweSrodekUdo(-B);
    % nogi przod
    prawePrzodBiodro(A);
    leweSrodekBiodro(-A);
    praweTylBiodro(A);
    % nogi dol
    prawePrzodUdo(C);
    praweTylUdo(C);
    leweSrodekUdo(C);
    % nogi tyl 
    leweSrodekBiodro(B);
    prawePrzodBiodro(-B);
    praweTylBiodro(-B);
    % nogi2 gora 
    lewePrzodUdo(-B);
    leweTylUdo(-B);
    praweSrodekUdo(-B);
    % nogi2 przod
    lewePrzodBiodro(-A);
    praweSrodekBiodro(A);
    leweTylBiodro(-A);
    % nogi2 dol
    lewePrzodUdo(C);
    leweTylUdo(C);
    praweSrodekUdo(C);
    %nogi2 tyl
    leweTylBiodro(B);
    lewePrzodBiodro(B);
    praweSrodekBiodro(-B);
    
    
end

prawePrzodBiodro(0);
prawePrzodUdo(0);    
prawePrzodPiszczel(0);
praweSrodekBiodro(0);
praweSrodekUdo(0);
praweSrodekPiszczel(0);
praweTylBiodro(0);
praweTylUdo(0);    
praweTylPiszczel(0);

lewePrzodBiodro(0);
lewePrzodUdo(0);    
lewePrzodPiszczel(0);
leweSrodekBiodro(0);
leweSrodekUdo(0);
leweSrodekPiszczel(0);
leweTylBiodro(0);
leweTylUdo(0);    
leweTylPiszczel(0);

% prawa przednia kończyna
function prawePrzodBiodro(X)
global ap2 ;
global bp2 ;
ap2 = rospublisher('/phantomx/j_c1_rf_position_controller/command');      
bp2 = rosmessage(ap2.MessageType);
bp2.Data = X;
send(ap2,bp2);
end
function prawePrzodUdo(X)
global cp2 ;
global dp2 ;
cp2 = rospublisher('/phantomx/j_thigh_rf_position_controller/command');     
dp2 = rosmessage(cp2.MessageType);
dp2.Data = X;
send(cp2,dp2);
end
function prawePrzodPiszczel(X)
global ep2 ;
global fp2 ;
ep2 = rospublisher('/phantomx/j_tibia_rm_position_controller/command');      
fp2 = rosmessage(ep2.MessageType);
fp2.Data = X;
send(ep2,fp2);
end
% prawa środkowa kończyna
function praweSrodekBiodro(X)
global ap1 ;
global bp1 ;
ap1 = rospublisher('/phantomx/j_c1_rm_position_controller/command');      
bp1 = rosmessage(ap1.MessageType);
bp1.Data = X;
send(ap1,bp1);
end
function praweSrodekUdo(X)
global cp1 ;
global dp1 ;
cp1 = rospublisher('/phantomx/j_thigh_rm_position_controller/command');      
dp1 = rosmessage(cp1.MessageType);
dp1.Data = X;
send(cp1,dp1);
end
function praweSrodekPiszczel(X)
global ep1 ;
global fp1 ;
ep1 = rospublisher('/phantomx/j_tibia_rm_position_controller/command');      
fp1 = rosmessage(ep1.MessageType);
fp1.Data = X;
send(ep1,fp1);
end

% tylna prawa kończyna
function praweTylBiodro(X)
global ap3 ;
global bp3 ;
ap3 = rospublisher('/phantomx/j_c1_rr_position_controller/command');      
bp3 = rosmessage(ap3.MessageType);
bp3.Data = X;
send(ap3,bp3);
end
function praweTylUdo(X)
global cp3 ;
global dp3 ;
cp3 = rospublisher('/phantomx/j_thigh_rr_position_controller/command');     
dp3 = rosmessage(cp3.MessageType);
dp3.Data = X;
send(cp3,dp3);
end
function praweTylPiszczel(X)
global ep3 ;
global fp3 ;
ep3 = rospublisher('/phantomx/j_tibia_rr_position_controller/command');      
fp3 = rosmessage(ep3.MessageType);
fp3.Data = X;
send(ep3,fp3);
end


% lewa przednia kończyna
function lewePrzodBiodro(X)
global al2 ;
global bl2 ;
al2 = rospublisher('/phantomx/j_c1_lf_position_controller/command');      
bl2 = rosmessage(al2.MessageType);
bl2.Data = X;
send(al2,bl2);
end
function lewePrzodUdo(X) 
global cl2 ;
global dl2 ;
cl2 = rospublisher('/phantomx/j_thigh_lf_position_controller/command');      
dl2 = rosmessage(cl2.MessageType);
dl2.Data = X;
send(cl2,dl2);
end
function lewePrzodPiszczel(X)
global el2 ;
global fl2 ;
el2 = rospublisher('/phantomx/j_tibia_lf_position_controller/command');     
fl2 = rosmessage(el2.MessageType);
fl2.Data = X;
send(el2,fl2);
end

% lewa środkowa kończyna
function leweSrodekBiodro(X)
global al1 ;
global bl1 ;
al1 = rospublisher('/phantomx/j_c1_lm_position_controller/command');      
bl1 = rosmessage(al1.MessageType);
bl1.Data = X;
send(al1,bl1);
end
function leweSrodekUdo(X)
global cl1 ;
global dl1 ;
cl1 = rospublisher('/phantomx/j_thigh_lm_position_controller/command');      
dl1 = rosmessage(cl1.MessageType);
dl1.Data = X;
send(cl1,dl1);
end
function leweSrodekPiszczel(X)
global el1 ;
global fl1 ;
el1 = rospublisher('/phantomx/j_tibia_lm_position_controller/command');      
fl1 = rosmessage(el1.MessageType);
fl1.Data = X;
send(el1,fl1);
end

% lewa tylnia kończyna
function leweTylBiodro(X)
global al3 ;
global bl3 ;
al3 = rospublisher('/phantomx/j_c1_rf_position_controller/command');      
bl3 = rosmessage(al3.MessageType);
bl3.Data = X;
send(al3,bl3);
end

function leweTylUdo(X) 
global cl3 ;
global dl3 ;
cl3 = rospublisher('/phantomx/j_thigh_lr_position_controller/command');      
dl3 = rosmessage(cl3.MessageType);
dl3.Data = X;
send(cl3,dl3);
end
function leweTylPiszczel(X)
global el3 ;
global fl3 ;
el3 = rospublisher('/phantomx/j_tibia_lr_position_controller/command');     
fl3 = rosmessage(el3.MessageType);
fl3.Data = X;
send(el3,fl3);
end
