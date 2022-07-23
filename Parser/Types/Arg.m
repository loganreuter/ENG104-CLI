classdef Arg
    %ARG Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        token
        name
        value
    end
    
    methods
        function obj = Arg(token)
            %ARG Construct an instance of this class
            %   Detailed explanation goes here
            obj.token = token;
            obj.name = token.value;
        end
        
        function obj = assignValue(obj, value)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.value = value;
        end
    end
end

