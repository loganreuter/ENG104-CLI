%Class for token type identifier
%Notation: -Variable_Name
classdef Identifier
    %IDENTIFIER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        pos
        raw
        value
    end
    
    methods
        function obj = Identifier(value, pos_range)
            %IDENTIFIER Construct an instance of this class
            %   Detailed explanation goes here
            obj.raw = value;
            
            value = char(value);
            
            obj.value = string(value(2:end));
            obj.pos = pos_range;
        end
    end
end

