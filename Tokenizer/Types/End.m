classdef End
    %END Summary of this class goes here
    %   Detailed explanation goes here
    properties
       exists
       pos
    end
    
    methods
        function obj = End(pos)
            obj.exists = false;
            obj.pos = pos;
        end
    end
end

