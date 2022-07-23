classdef Number
    %NUMBER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        val
        pos
    end
    
    methods
        function obj = Number(val,pos_range)
            %NUMBER Construct an instance of this class
            %   Detailed explanation goes here
            
            obj.val = str2double(val);
            obj.pos = pos_range;
            %disp(obj.val)
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

