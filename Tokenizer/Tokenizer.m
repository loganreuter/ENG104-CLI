classdef Tokenizer 
    properties
        pos {mustBeNumeric}
        tokens
    end
    
    methods(Access=private)
        function obj = lexIdent(obj, str)
            name = "";
            initPos = obj.pos;
            finPos = 0;
            while str(obj.pos) == "-" || isletter(str(obj.pos)) || isnumeric(str(obj.pos)) || str(obj.pos) == "_"
                name = name + str(obj.pos);
                finPos = obj.pos;
                obj.pos = obj.pos + 1;
            end
            obj.pos = obj.pos - 1;
            obj.tokens{end + 1} = Identifier(name, [initPos, finPos]);
        end
        
        function obj = lexCallIdent(obj, str)
            name = "";
            initPos = obj.pos;
            finPos = 0;
            while isletter(str(obj.pos)) || str(obj.pos) == "_"
               name = name + str(obj.pos);
               finPos = obj.pos;
               obj.pos = obj.pos + 1;
            end
            obj.tokens{end + 1} = CallIdent(name, [initPos, finPos]);
        end
        
        function obj = lexNumber(obj, str)
            val = "";
            initPos = obj.pos;
            finPos = 0;
            
            while isstrprop(str(obj.pos), 'digit') || str(obj.pos) == "."
               val = val + str(obj.pos);
               finPos = obj.pos;
               obj.pos = obj.pos + 1;
            end
            %disp(val);
            obj.pos = obj.pos - 1;
            obj.tokens{end+1} = Number(val, [initPos, finPos]);
        end
    end
    
    methods
        %Not a constructor, used to break up and characterize input
        function [obj, errors] = Tokenize(obj, input_str)
            obj.pos = 0;
            obj.tokens = {};
            errors = strings;
            
            addpath("./Tokenizer/Types/");
            
            while obj.pos < length(input_str)
                obj.pos = obj.pos + 1;
                c = input_str(obj.pos);
                %disp(c)
                
                if(isspace(c))
                    continue
                elseif(c == ';')
                    obj.tokens{end + 1} = End(obj.pos);
                    continue
                elseif(c == '-')
                    obj = obj.lexIdent(input_str);
                elseif(isstrprop(string(c), 'digit'))
                    obj = obj.lexNumber(input_str);
                elseif(isletter(string(c)))
                    obj = obj.lexCallIdent(input_str);
                else
                    errors = errors + sprintf("ERROR: Unknown character %s at position %d", string(c), obj.pos);
                end
            end
            
            if(errors(1) == "")
                errors = strings(0);
            end
        end
    end
end