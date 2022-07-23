classdef Function
    %FUNCTION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Name %Name of function
        Call %Callback when no arguments are passed
        Eqn %String of equation to print out
        Description %Description of said function
    end
    
    methods
        function obj = Function(name, call, desc)
            %FUNCTION Construct an instance of this class
            %   Detailed explanation goes here
            obj.Name = name;
            obj.Call = call;
            obj.Description = desc;
        end
        
        function str = String(obj)
           str = sprintf("%s - %s", obj.Name, obj.Description) ;
        end
    end
end

