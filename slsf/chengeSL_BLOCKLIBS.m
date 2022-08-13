function [SL_BLOCKLIBS,cfg_format] = chengeSL_BLOCKLIBS(Action)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
% 1表示sqrt()开根操作
% 2表示power（i，2）平方操作
% 3表示sigmoid操作
global cfg_param;
for i=1:7
    cfg_param(i) = ch_updateparam(Action(i),cfg_param(i));
    if(cfg_param(i)<0)
        cfg_param(i) = 0;
    end
end

cfg_format = cfg_param;
SL_BLOCKLIBS = {
           struct('name', 'Discrete', 'is_blk', false, 'num', cfg_format(1))
%             struct('name', 'Continuous', 'is_blk', false,  'num', 0.2)
             struct('name', 'Math Operations', 'is_blk', false,  'num', cfg_format(2))
%             struct('name', 'Logic and Bit Operations', 'is_blk', false,  'num', 0.2)
            struct('name', 'Sinks', 'is_blk', false, 'num', cfg_format(3))
            struct('name', 'Sources', 'is_blk', false, 'num', cfg_format(4))
            struct('name', 'simulink/Sources/Constant', 'is_blk', true, 'num', cfg_format(5))
            struct('name', 'simulink/Ports & Subsystems/Subsystem', 'is_blk', true, 'num', cfg_format(6))
           struct('name', 'simulink/Ports & Subsystems/If', 'is_blk', true, 'num', cfg_format(7))
         %   struct('name', 'simulink/Ports & Subsystems/Model', 'is_blk', true, 'num', 0.05)
        };
end

