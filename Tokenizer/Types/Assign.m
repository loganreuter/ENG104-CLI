classdef Assign
    %ASSIGN Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        val
        pos
    end
    
    methods
        function obj = Assign(pos_range)
            %ASSIGN Construct an instance of this class
            %   Detailed explanation goes here
            obj.val = "=";
            obj.pos = pos_range;
        end
    end
end

