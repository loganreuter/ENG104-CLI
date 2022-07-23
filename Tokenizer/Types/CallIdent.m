classdef CallIdent
    %CALLIDENT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        value
        pos
    end
    
    methods
        function obj = CallIdent(value,pos_range)
            %CALLIDENT Construct an instance of this class
            %   Detailed explanation goes here
            obj.value = value;
            obj.pos = pos_range;
        end
    end
end

