function [] = curveForLambda(lambda_vec, error_train, error_val)

close all;
plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Validation');
xlabel('lambda');
ylabel('Error');

fprintf('lambda\t\tTrain Error\tValidation Error\n');
for i = 1:length(lambda_vec)
	fprintf(' %f\t%f\t%f\n', ...
            lambda_vec(i), error_train(i), error_val(i));
end

end