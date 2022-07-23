classdef Variable
    %VARIABLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Name
        Symbol
        Description
        Value
    end
    
    methods
        function obj = Variable(name, symbol, desc)
            %VARIABLE Construct an instance of this class
            %   Detailed explanation goes here
            obj.Name = name;
            obj.Symbol = symbol;
            obj.Description = desc;
        end
        
        function obj = AssignValue(obj, val)
            obj.Value = val;
        end
        
        function obj = Clear(obj)
            clear(obj.Value);
        end
    end
end

