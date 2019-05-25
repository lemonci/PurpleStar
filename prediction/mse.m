classdef MSE < Metric

    methods
        function obj = MSE()
            obj.name = 'Mean Squared Error';
        end
    end
    
    methods(Static = true)
        
        
        function mse = calculateMetric(argum1,argum2)

            if nargin == 2
                diffs = argum1 - argum2
            else
                error("only one argument is provided. Need two. ")
            end
            diffs = diffs.^2
            mse = sum(diffs);
        end
        
        function value = calculateCrossvalMetric(argum1,argum2)
            %CALCULATECROSSVALMETRIC Computes the evaluation metric and returns
            %it as an error.
            %   METRIC = CALCULATECROSSVALMETRIC(CM) returns calculated metric from confussion
            %   matrix CM
            %   METRIC = CALCULATECROSSVALMETRIC(actual, pred) returns calculated metric from
            %   real labels (ACTUAL) labels and predicted labels (PRED)
            if nargin == 2
                value = MSE.calculateMetric(argum1,argum2);
            else
                value = MSE.calculateMetric(argum1);
            end
        end
        
    end
    
    
end
