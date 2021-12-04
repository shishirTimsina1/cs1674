function [loss] = hinge_loss(scores, correct_class)

cr = scores(correct_class);


counter = 0;
Li = 0;
for i=1:4
    if scores(i) ~= cr
        Li = max(0, scores(i) - cr +1);
    end
    counter = counter + Li;
end

loss = counter;

end

