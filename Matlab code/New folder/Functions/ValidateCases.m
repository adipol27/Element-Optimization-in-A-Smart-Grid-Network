function [validations] = ValidateCases()
    cases = dir('cases\*.m');
    cases = {cases.name };
    for i = 1:length(cases)
        fprintf( 'Case %d : %s ...', i, cases{i});
        [valid, validation] = ValidateCase(['Cases\' cases{i}]);
        if ~valid
            fprintf('is invalid\n');
            disp(validation);
        else
            fprintf('valid\n');
        end
        validations(i) = validation;
    end
    
    fprintf('\n----------------------------\nInvalid cases:\n')
    disp({validations(~[validations.valid]).case})
end