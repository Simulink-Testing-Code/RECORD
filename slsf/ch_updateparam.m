function newparam = ch_updateparam(action_i,param)
% 1表示sqrt()开根操作
% 2表示power（i，2）平方操作
% 3表示sigmoid操作
    switch action_i
        case 1
%             newparam = sqrt(param);
            newparam = param + 0.02;%0.05  0.1
        case 2
            newparam = param - 0.02;%0.05  0.1
%             newparam = power(param,2);
        case 3
%             newparam = ch_sigmoid(param);
            newparam = param;
    end
end