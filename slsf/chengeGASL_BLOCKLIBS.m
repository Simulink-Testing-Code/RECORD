function SL_BLOCKLIBS = chengeGASL_BLOCKLIBS(Action)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
SL_BLOCKLIBS = {
           struct('name', 'Discrete', 'is_blk', false, 'num', Action(1))
%             struct('name', 'Continuous', 'is_blk', false,  'num', 0.2)
             struct('name', 'Math Operations', 'is_blk', false,  'num', Action(2))
%             struct('name', 'Logic and Bit Operations', 'is_blk', false,  'num', 0.2)
            struct('name', 'Sinks', 'is_blk', false, 'num', Action(3))
            struct('name', 'Sources', 'is_blk', false, 'num', Action(4))
            struct('name', 'simulink/Sources/Constant', 'is_blk', true, 'num', Action(5))
            struct('name', 'simulink/Ports & Subsystems/Subsystem', 'is_blk', true, 'num', Action(6))
           struct('name', 'simulink/Ports & Subsystems/If', 'is_blk', true, 'num', Action(7))
         %   struct('name', 'simulink/Ports & Subsystems/Model', 'is_blk', true, 'num', 0.05)
        };
end

