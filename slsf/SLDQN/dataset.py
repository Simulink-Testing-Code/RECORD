PortsandSubsystems = ['ConfigurableSubsystem', 'Enable', 'EnabledSubsystem', 'EnabledandTriggeredSubsystem',
                      'ForEachSubsystem', 'ForIteratorSubsystem', 'FunctionCallFeedbackLatch', 'FunctionCallGenerator',
                      'FunctionCallSplit', 'FunctionCallSubsystem', 'If', 'IfActionSubsystem', 'InBusElement',
                      'Inport', 'Model', 'OutBusElement', 'Outport', 'ResettableSubsystem', 'SwitchCase',
                      'SwitchCaseActionSubsystem', 'Trigger', 'TriggeredSubsystem', 'UnitSystemConfiguration',
                      'WhileIteratorSubsystem', 'SubSystem']

MathOperations = ['Abs', 'Add', 'AlgebraicConstraint', 'Assignment', 'Bias', 'ComplextoMagnitudeAngle',
                  'ComplextoRealImag', 'Divide', 'DotProduct', 'FindNonzeroElements', 'Gain', 'MagnitudeAngletoComplex',
                  'MathFunction', 'MinMax', 'MinMaxRunningResettable', 'PermuteDimensions', 'Polynomial', 'Product',
                  'ProductofElements', 'RealImagtoComplex', 'Reshape', 'RoundingFunction', 'Sign', 'SineWaveFunction',
                  'SliderGain', 'Sqrt', 'Squeeze', 'TrigonometricFunction', 'UnaryMinus', 'WeightedSampleTimeMath',
                  'Sum',
                  'Subtract', 'SumofElements', 'Sin', 'Rounding', 'Math']

LogicandBitOperations = ['BitClear', 'BitSet', 'BitwiseOperator', 'CombinatorialLogic', 'CompareToConstant',
                         'CompareToZero', 'DetectChange', 'DetectDecrease', 'DetectFallNegative',
                         'DetectFallNonpositive', 'DetectIncrease', 'DetectRiseNonnegative', 'DetectRisePositive',
                         'ExtractBits', 'IntervalTest', 'IntervalTestDynamic', 'LogicalOperator', 'RelationalOperator',
                         'ShiftArithmetic']

Sinks = ['Display', 'FloatingScopeandScopeViewer', 'OutBusElement', 'Outport', 'Scope', 'StopSimulation', 'Terminator',
         'ToFile', 'ToWorkspace', 'Record', 'XYGraph']

Continuous = ['Derivative', 'DescriptorStateSpace', 'EntityTransportDelay', 'FirstOrderHold', 'Integrator',
              'IntegratorLimited', 'PIDController', 'SecondOrderIntegrator', 'SecondOrderIntegratorLimited',
              'StateSpace', 'TransferFcn', 'TransportDelay', 'VariableTimeDelay', 'VariableTransportDelay',
              'ZeroPole']

Discontinuities = ['Backlash', 'CoulombandViscousFriction', 'DeadZone', 'DeadZoneDynamic', 'HitCrossing', 'PWM',
                   'Quantizer', 'RateLimiter', 'RateLimiterDynamic', 'Relay', 'Saturation', 'SaturationDynamic',
                   'VariablePulseGenerator', 'WrapToZero']

Discrete = ['Delay', 'Difference', 'DiscreteDerivative', 'DiscreteFIRFilter', 'DiscreteFilter', 'DiscretePIDController',
            'DiscreteStateSpace', 'DiscreteTransferFcn', 'DiscreteZeroPole', 'DiscreteTimeIntegrator', 'Memory',
            'ResettableDelay', 'TappedDelay', 'TransferFcnFirstOrder', 'TransferFcnLeadorLag', 'TransferFcnRealZero',
            'UnitDelay', 'VariableIntegerDelay', 'ZeroOrderHold']

Sources = ['BandLimitedWhiteNoise', 'ChirpSignal', 'Clock', 'Constant', 'CounterFreeRunning', 'CounterLimited',
           'DigitalClock', 'EnumeratedConstant', 'FromFile', 'FromSpreadsheet', 'FromWorkspace', 'Ground',
           'InBusElement', 'Inport', 'PulseGenerator', 'Ramp', 'RandomNumber', 'RepeatingSequence',
           'RepeatingSequenceInterpolated', 'RepeatingSequenceStair', 'SignalBuilder', 'SignalEditor',
           'SignalGenerator',
           'SineWave', 'Step', 'UniformRandomNumber', 'WaveformGenerator']

Dashboard = ['CallbackButton', 'CheckBox', 'ComboBox', 'DashboardScope', 'Display', 'Edit', 'Gauge', 'HalfGauge',
             'Knob',
             'Lamp', 'LinearGauge', 'MultiStateImage', 'PushButton', 'QuarterGauge', 'RadioButton', 'RockerSwitch',
             'RotarySwitch', 'Slider', 'SliderSwitch', 'ToggleSwitch']

LookupTables = ['1DLookupTable', '2DLookupTable', 'InterpolationUsingPrelookup', 'LookupTableDynamic', 'Prelookup',
                'n-DLookupTable']

MatrixOperations = ['CrossProduct', 'HermitianTranspose', 'IdentityMatrix', 'IsSymmetric', 'IsTriangular',
                    'MatrixSquare',
                    'Transpose']

MessageandEvents = ['HitCrossing', 'MessageMerge', 'Queue', 'Receive', 'Send', 'SequenceViewer']

ModelVerification = ['Assertion', 'CheckDynamicGap', 'CheckDynamicRange', 'CheckStaticGap', 'CheckStaticRange',
                     'CheckDiscreteGradient', 'CheckDynamicLowerBound', 'CheckDynamicUpperBound',
                     'CheckInputResolution',
                     'CheckStaticLowerBound', 'CheckStaticUpperBound']

ModelWideUtilities = ['Block Support Table', 'DocBlock', 'Model Info', 'TimedBasedLinearization',
                      'TriggerBasedLinearization']

SignalAttributes = ['BustoVector', 'DataTypeConversion', 'DataTypeConversionInherited', 'DataTypeDuplicate',
                    'DataTypePropagation', 'DataTypeScalingStrip', 'IC', 'Probe', 'RateTransition', 'SignalConversion',
                    'SignalSpecification', 'UnitConversion', 'WeightedSampleTime', 'Width']

SignalRouting = ['BusAssignment', 'BusCreator', 'BusSelector', 'DataStoreMemory', 'DataStoreRead',
                 'DataStoreWrite', 'Demux', 'EnvironmentController', 'From', 'Goto', 'GotoTagVisibility',
                 'IndexVector', 'ManualSwitch', 'ManualVariantSink', 'ManualVariantSource', 'Merge',
                 'MultiportSwitch', 'Mux', 'ParameterWriter', 'Selector', 'StateReader', 'StateWriter', 'Switch',
                 'VariantSink', 'VariantSource']

String = ['ASCIItoString', 'ComposeString', 'ScanString', 'StringCompare', 'StringConcatenate', 'StringConstant',
          'StringContains', 'StringCount', 'StringFind', 'StringLength', 'StringtoASCII', 'StringtoDouble',
          'StringtoEnum',
          'StringtoSingle', 'Substring', 'ToString']

AdditionalDiscrete = ['FixedPointStateSpace', 'TransferFcnDirectFormII', 'TransferFcnDirectFormIITimeVarying']

AdditionalMath = ['DecrementRealWorld', 'DecrementStoredInteger', 'DecrementTimeToZero', 'DecrementToZero',
                  'IncrementRealWorld', 'IncrementStoredInteger']

metrics = ['CloneContent',
           'CloneDetection',
           'CyclomaticComplexity',
           'DescriptiveBlockNames',
           'DiagnosticWarningsCount',
           'ExplicitIOCount',
           'FileCount',
           'IOCount',
           'LayerSeparation',
           'LibraryContent',
           'LibraryLinkCount',
           'MatlabCodeAnalyzerWarnings',
           'MatlabFunctionCount',
           'MatlabLOCCount',
           'ModelAdvisorCheckCompliance.hisl_do178',
           'ModelAdvisorCheckCompliance.maab',
           'ModelAdvisorCheckIssues.hisl_do178',
           'ModelAdvisorCheckIssues.maab',
           'ModelFileCount',
           'ParameterCount',
           'SimulinkBlockCount',
           'StateflowChartCount',
           'StateflowChartObjectCount',
           'StateflowLOCCount',
           'SubSystemCount',
           'SubSystemDepth'
           ]

bug0 = ['Sample1001.mdl', 'Sample161.mdl', 'Sample215.mdl', 'Sample231.mdl', 'Sample274.mdl', 'Sample295.mdl',
        'Sample299.mdl', 'Sample355.mdl', 'Sample37.mdl', 'Sample39.mdl', 'Sample404.mdl', 'Sample409.mdl',
        'Sample487.mdl', 'Sample527.mdl', 'Sample541.mdl', 'Sample607.mdl', 'Sample666.mdl', 'Sample681.mdl',
        'Sample732.mdl', 'Sample742.mdl', 'Sample752.mdl', 'Sample811.mdl', 'Sample845.mdl', 'Sample862.mdl',
        'Sample91.mdl', 'Sample92.mdl', 'Sample974.mdl', 'Sample984.mdl', 'Sample992.mdl']
bug1 = ['Sample362.mdl', 'Sample745.mdl']
bug2 = ['Sample170.mdl', 'Sample301.mdl', 'Sample490.mdl', 'Sample546.mdl', 'Sample673.mdl', 'Sample676.mdl',
        'Sample683.mdl', 'Sample807.mdl', 'Sample809.mdl', 'Sample870.mdl']
bug3 = ['Sample646.mdl']
bug4 = ['Sample612.mdl']
bug5 = ['Sample334.mdl']
bug6 = ['Sample754.mdl']
bug7 = ['Sample443.mdl']
bug8 = ['Sample448.mdl']
bug9 = ['Sample511.mdl']
buga = ['Sample990.mdl']
bugb = ['Sample21.mdl']
bugc = ['Sample44.mdl']
bugd = ['Sample292.mdl']
buge = ['Sample333.mdl']
bugf = ['Sample1125.mdl']
# 269 is wrong
bugg = ['Sample1023.mdl', 'Sample1044.mdl', 'Sample1053.mdl', 'Sample269.mdl', 'Sample288.mdl', 'Sample69.mdl']
bugh = ['Sample111.mdl', 'Sample425.mdl']
bugi = ['Sample1081.mdl']
bugj = ['Sample1188.mdl']
bugk = ['Sample319.mdl']
bugl = ['Sample120.mdl']
bug_total = bug0 + bug1 + bug2 + bug3 + bug4 + bug5 + bug6 + bug7 + bug8 + bug9 + buga + bugb + bugc + bugd + buge + bugf + bugg + bugh + bugi + bugj + bugk + bugl

bug_cat = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
           'l']

metrics = ["CloneContent",
           "CloneDetection",
           "CyclomaticComplexity",
           "DescriptiveBlockNames",
           "DiagnosticWarningsCount",
           "ExplicitIOCount",
           "FileCount",
           "IOCount",
           "LayerSeparation",
           "LibraryContent",
           "LibraryLinkCount",
           "MatlabCodeAnalyzerWarnings",
           "MatlabFunctionCount",
           "MatlabLOCCount",
           "ModelFileCount",
           "ParameterCount",
           "SimulinkBlockCount",
           "StateflowChartCount",
           "StateflowChartObjectCount",
           "StateflowLOCCount",
           "SubSystemCount",
           "SubSystemDepth",
           "ModelAdvisorCheckCompliance.hisl_do178",
           "ModelAdvisorCheckCompliance.maab",
           "ModelAdvisorCheckIssues.hisl_do178",
           "ModelAdvisorCheckIssues.maab",
           ]
