classdef SLDQNENV < rl.env.MATLABEnvironment
    %SLDQN: Template for defining custom environment in MATLAB.    
   
    %% Properties (set properties' attributes accordingly)
    properties
        % Specify and initialize environment's necessary properties    
        MaxSLParam = [1 1 1 1 1 1 1];
        %采样时间
        Ts = 0.02
        isNewevn = false;   %环境是否更新
        goal = false;
        failedCode = false;
     %{   
        DiscreteNum ;
        MathOperationsNum ;
        SinksNum ;
        SourcesNum ;
        ConstantNum;
        SubsystemNum ;
        IfNum ;
      %}
        %认定失败的距离大小
        DisplacementThreshold = 2.4
    end
    
    properties
        % 初始化状态向量，就是模型特征向量init_Vector（特征向量长度）[块，线，复杂度]。
        % Initialize system state [x,dx,theta,dtheta]'
        %State = zeros(init_Vector,1)
        State = zeros(dqncfg.stateLen,dqncfg.NUM_TESTS)
    end
    
    properties(Access = protected)
        % Initialize internal flag to indicate episode termination
        IsDone = false  
    end

    %% Necessary Methods
    methods              
        % Contructor method creates an instance of the environment
        % Change class name and constructor name accordingly
        % 构造函数
        function this = SLDQNENV()
            % Initialize Observation settings
            ObservationInfo = rlNumericSpec([1 dqncfg.stateLen]);%三个维度：块信息，线特征，复杂度特征
            ObservationInfo.Name = 'SLDQN States';
            ObservationInfo.Description = '块信息，线特征，复杂度特征';

            % Initialize Action settings  
            % 1表示sqrt()开根操作
            % 2表示power（i，2）平方操作
            % 3表示sigmoid操作
            % 七个动作分别对应七个配置参数采用的操作，每个动作可以取1，2 或 3
            ActionInfo = rlFiniteSetSpec([1 2 3 4 5 6 7]);
            ActionInfo.Name = 'SLDQN Action';
            
            % The following line implements built-in functions of RL env
            % 下面这行实现了RL环境的内置函数
            this = this@rl.env.MATLABEnvironment(ObservationInfo,ActionInfo);
            
            % Initialize property values and pre-compute necessary values
            % 初始化属性值并预先计算必要的值
            initeActionInfo(this);
        end
        
        % Apply system dynamics and simulates the environment with the 
        % given action for one step.
        %处理输入动作。
        %评估一个时间步长的环境动态方程。
        %计算并返回更新的观测值。
        %计算并返回奖励信号。
        %检查剧集是否完成并IsDone根据需要返回信号。
        %生成环境已更新的通知。        
        function [oldstate,SLParam,Reward,Observation,IsDone] = step(this,Action,t) 
                % state  action   reward  newstate terminateFlag
            % Get action
            SLParam = getSLParam(this,Action);
            %Force = getForce(this,Action);            
            
            % Unpack state vector
            oldstate = this.State';  %行向量

           %调用updateState状态更新函数
            %Observation = updateState();
            [Observation,Reward,restart] = updateState(SLParam,oldstate);
            % Update system states
            this.setState(Observation');
            disp('---------State updated-----------')
            disp(this.State)
            % Check terminal condition
            this.goal = (t >= dqncfg.MAX_ITERATER);  %完成一次episode
            
%             if this.goal || Reward==-100 || restart
            if this.goal 
                IsDone = true;
            else
                IsDone = false;
            end
            
          
            % (optional) use notifyEnvUpdated to signal that the 
            % environment has been updated (e.g. to update visualization)
            notifyEnvUpdated(this);
        end
        
        % 将环境重置为初始状态并返回初始观察
        % Reset environment to initial state and output initial observation
        function InitialObservation = reset(this)
            % 初始化模型特征

            disp('----------------------InitialObservation----------------------')
            diver_feature =  rand([dqncfg.stateLen dqncfg.NUM_TESTS]);  %随机生成状态
            global cfg_param;
            cfg_param = [0.14 0.23 0.17 0.12 0.06 0.24 0.04];
%             cfg_param = [0.22 0.23 0.04 0.24 0.16 0.04 0.07];
            InitialObservation = diver_feature;
            this.State = InitialObservation;
       
            % （可选）使用 notifyEnvUpdated 来表示环境已更新（例如，更新可视化）
            % (optional) use notifyEnvUpdated to signal that the 
            % environment has been updated (e.g. to update visualization)
            notifyEnvUpdated(this);
        end
    end
    %% Optional Methods (set methods' attributes accordingly)
    methods               
        % Helper methods to create the environment
        % Discrete force 1 or 2
        function SLParam = getSLParam(this,action)
            if ~length(action)==7
                error('Action 必须包含七个元素.');
            end
            disp(['---------action is: ']);
            disp(action);
            SLParam = action;           
        end
        % update the action info based on max force
        function updateActionInfo(this,Action)
            this.ActionInfo.Elements = Action;
        end
        function initeActionInfo(this)
            this.ActionInfo.Elements = [randi(3),randi(3),randi(3),...
                                        randi(3),randi(3),randi(3),randi(3)];
        end
        function actionInfo = getActionInfo(this)
             actionInfo = this.ActionInfo.Elements;
        end
        function setState(this,state)
             this.State = state;
        end
        
    
        % (optional) Visualization method
        function plot(this)
            % Initiate the visualization
            
            % Update the visualization
            envUpdatedCallback(this)
        end
        
        % (optional) Properties validation through set methods
        %{
        function set.State(this,state)
            validateattributes(state,{'numeric'},{'finite'},'','State');
            this.State = state(:);
            notifyEnvUpdated(this);
        end
        %}
        function set.MaxSLParam(this,val)
            validateattributes(val,{'numeric'},{'finite','real','positive','vector'},'','MaxSLParam');
            this.MaxForce = val;
            updateActionInfo(this);
        end
        function set.Ts(this,val)
            validateattributes(val,{'numeric'},{'finite','real','positive','scalar'},'','Ts');
            this.Ts = val;
        end
       
        function set.DisplacementThreshold(this,val)
            validateattributes(val,{'numeric'},{'finite','real','positive','scalar'},'','DisplacementThreshold');
            this.DisplacementThreshold = val;
        end
        
    end
    
    methods (Access = protected)
        % (optional) update visualization everytime the environment is updated 
        % (notifyEnvUpdated is called)
        function envUpdatedCallback(this)
            disp('------evn has been update------');
            this.ActionInfo()
        end
    end
end
