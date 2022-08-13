# -*- coding: utf-8 -*-
"""
Created on Fri Dec  3 16:55:11 2021

@author: LENOVO
"""

AllBLOCK = ['ConfigurableSubsystem', 'Enable', 'EnabledSubsystem', 'EnabledandTriggeredSubsystem',
                      'ForEachSubsystem', 'ForIteratorSubsystem', 'FunctionCallFeedbackLatch', 'FunctionCallGenerator',
                      'FunctionCallSplit', 'FunctionCallSubsystem', 'If', 'IfActionSubsystem', 'InBusElement',
                      'Inport', 'Model', 'OutBusElement', 'Outport', 'ResettableSubsystem', 'SwitchCase',
                      'SwitchCaseActionSubsystem', 'Trigger', 'TriggeredSubsystem', 'UnitSystemConfiguration',
                      'WhileIteratorSubsystem', 'SubSystem','Abs', 'Add', 'AlgebraicConstraint', 'Assignment', 'Bias', 'ComplextoMagnitudeAngle',
                      'ComplextoRealImag', 'Divide', 'DotProduct', 'FindNonzeroElements', 'Gain', 'MagnitudeAngletoComplex',
                      'MathFunction', 'MinMax', 'MinMaxRunningResettable', 'PermuteDimensions', 'Polynomial', 'Product',
                      'ProductofElements', 'RealImagtoComplex', 'Reshape', 'RoundingFunction', 'Sign', 'SineWaveFunction',
                      'SliderGain', 'Sqrt', 'Squeeze', 'TrigonometricFunction', 'UnaryMinus', 'WeightedSampleTimeMath',
                      'Sum','BitClear', 'BitSet', 'BitwiseOperator', 'CombinatorialLogic', 'CompareToConstant',
                      'CompareToZero', 'DetectChange', 'DetectDecrease', 'DetectFallNegative',
                      'DetectFallNonpositive', 'DetectIncrease', 'DetectRiseNonnegative', 'DetectRisePositive',
                      'ExtractBits', 'IntervalTest', 'IntervalTestDynamic', 'LogicalOperator', 'RelationalOperator',
                      'ShiftArithmetic','Display', 'FloatingScopeandScopeViewer', 'OutBusElement', 'Outport', 'Scope', 'StopSimulation', 'Terminator',
                      'ToFile', 'ToWorkspace', 'Record', 'XYGraph','BandLimitedWhiteNoise', 'ChirpSignal', 'Clock', 'Constant', 'CounterFreeRunning', 'CounterLimited',
                      'DigitalClock', 'EnumeratedConstant', 'FromFile', 'FromSpreadsheet', 'FromWorkspace', 'Ground',
                      'InBusElement', 'Inport', 'PulseGenerator', 'Ramp', 'RandomNumber', 'RepeatingSequence',
                      'RepeatingSequenceInterpolated', 'RepeatingSequenceStair', 'SignalBuilder', 'SignalEditor',
                      'SignalGenerator','SineWave', 'Step', 'UniformRandomNumber', 'WaveformGenerator','BustoVector', 'DataTypeConversion', 'DataTypeConversionInherited', 'DataTypeDuplicate',
                      'DataTypePropagation', 'DataTypeScalingStrip', 'IC', 'Probe', 'RateTransition', 'SignalConversion',
                      'SignalSpecification', 'UnitConversion', 'WeightedSampleTime', 'Width']


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
Sources = ['BandLimitedWhiteNoise', 'ChirpSignal', 'Clock', 'Constant', 'CounterFreeRunning', 'CounterLimited',
           'DigitalClock', 'EnumeratedConstant', 'FromFile', 'FromSpreadsheet', 'FromWorkspace', 'Ground',
           'InBusElement', 'Inport', 'PulseGenerator', 'Ramp', 'RandomNumber', 'RepeatingSequence',
           'RepeatingSequenceInterpolated', 'RepeatingSequenceStair', 'SignalBuilder', 'SignalEditor',
           'SignalGenerator',
           'SineWave', 'Step', 'UniformRandomNumber', 'WaveformGenerator']
SignalAttributes = ['BustoVector', 'DataTypeConversion', 'DataTypeConversionInherited', 'DataTypeDuplicate',
                    'DataTypePropagation', 'DataTypeScalingStrip', 'IC', 'Probe', 'RateTransition', 'SignalConversion',
                    'SignalSpecification', 'UnitConversion', 'WeightedSampleTime', 'Width']