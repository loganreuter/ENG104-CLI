addpath("./Tokenizer/", "./Parser/", "./Evaluator/");
tokenizer = Tokenizer();
parser = Parser();
evaluator = Evaluator();

fprintf("Welcome to the ENG104 (Mechanics of Materials) Calculator CLI!\nAuthor: Logan Reuter\nDate: 7/14/2022\nType 'help' to get a list of available functions.\nType 'exit' or Ctrl+C to end the program at any time.\n\n")

while true
    cmd = input("ENG104 Calculator >> ", "s");
    cmd = append(lower(cmd), ';');
    if(cmd == "exit;")
        return;
    end
    
    [tokenizer, errors] = tokenizer.Tokenize(cmd);
    %Check if any errors arose, if so reset loop
    if(~isempty(errors))
       for err = errors
          fprintf(2, err + "\n") 
       end
       continue
    end
    
    [parser, errors] = parser.Parse(tokenizer.tokens);
    if(~isempty(errors))
        for err = errors
            fprintf(2, err + "\n") 
        end
        continue
    end
    %disp(parser.ast)
    [evaluator, errors] = evaluator.Evaluate(parser.ast);
    if(~isempty(errors))
        for err = errors
            fprintf(2, err + "\n");
        end
        continue
    end
end

