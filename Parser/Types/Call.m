classdef Call
    %CALL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        token
        name
        
        args
    end
    
    methods
        function obj = Call(token)
            %CALL Construct an instance of this class
            %   Detailed explanation goes here
            obj.token = token;
            obj.name = token.value;
        end
        
        function obj = addArg(obj, arg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            obj.args(end + 1) = arg;
        end
    end
end

