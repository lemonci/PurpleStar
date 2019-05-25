classdef MSE < Metric
    
    methods
        function obj = MSE()
            obj.name = 'Mean Squared Error';
        end
    end
    
    methods(Static = true)
        
        function mse = calculateMetric(argum1,argum2)
            %CALCULATEMETRIC Computes the evaluation metric
            %   METRIC = CALCULATEMETRIC(CM) returns calculated metric from confussion
            %   matrix CM
            %   METRIC = CALCULATEMETRIC(actual, pred) returns calculated metric from
            %   real labels (ACTUAL) labels and predicted labels (PRED)
            if nargin == 2
                mse = sum(abs(argum1 - argum2).^2)/numel(argum1);
            else
                n=size(argum1,1);
                cm = double(argum1);
                cost = abs(repmat(1:n,n,1) - repmat((1:n)',1,n));
                mse = sum(sum(cost.*cm).^2) / sum(sum(cm));
            end
        end
        
        
        function value = calculateCrossvalMetric(argum1,argum2)
            %CALCULATECROSSVALMETRIC Computes the evaluation metric and returns
            %it as an error.
            %   METRIC = CALCULATECROSSVALMETRIC(CM) returns calculated metric from confussion
            %   matrix CM
            %   METRIC = CALCULATECROSSVALMETRIC(actual, pred) returns calculated metric from
            %   real labels (ACTUAL) labels and predicted labels (PRED)
            if nargin == 2,
                value = MSE.calculateMetric(argum1,argum2);
            else
                value = MSE.calculateMetric(argum1);
            end
        end
        
        
        
    end
    
    
end
