classdef Parser
    %PARSER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        tokens
        ast
        pos
    end
    
    methods(Access=private)
        function [obj, args, errors] = check(obj)
            errors = strings;
            args = Arg.empty;
            
            while obj.pos + 1 < length(obj.tokens)
                obj.pos = obj.pos + 1;
                token = obj.tokens(obj.pos);
                next = obj.tokens(obj.pos + 1);
                if(isa(token{1}, 'Identifier'))
                    arg = Arg(token{1});
                    
                    if(isa(next{1}, 'Number'))
                        arg = arg.assignValue(next{1}.val);
                        obj.pos = obj.pos + 1;
                    else
                        errors = errors + sprintf("ERROR (col %d): Expected Number, Found %s", next{1}.pos, class(next{1}));
                        
                    end
                    
                    %disp(arg);
                    args(end + 1) = arg;
                else
                    errors = errors + sprintf("ERROR (col %d): Expected Identifier, Found %s", token{1}.pos, class(token{1}));
                    continue;
                end
            end
            
            if(errors(1) == "")
                errors = strings(0);
            end
        end     
   end
    
    methods
        function [obj, errors] = Parse(obj, tokens)
            %Parse Summary of this method goes here
            %   Detailed explanation goes here
            obj.tokens = tokens;
            obj.pos = 1;
            errors = strings;
            
            %disp(obj.tokens)
            
            addpath("./Parser/Types/");
            
            first = tokens(1);
            if(~isa(first{1}, 'CallIdent'))
                errors = errors + sprintf("ERROR (col %d): Expected a Function, Found %s", first{1}.pos, class(first{1}));
                return
            end
            
            obj.ast = Call(first{1});
            
            %Stop here if no arguments are passed
            if(length(tokens) == 1)
                if(errors(1) == "")
                    errors = strings(0);
                end
                
                return
            end
            
            [obj, args, errs] = obj.check();
            if(~isempty(errs))
                errors = errors + errs;
                return
            end
            
            obj.ast.args = args;
            
            if(errors(1) == "")
                errors = strings(0);
            end
        end
    end
end

