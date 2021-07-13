function [xc, fEvals] = Newton(f, x0, delta, fEvalMax)
% f is a HANDLE to a continuous function, f(x), of a single variable.
% x0 is an initial guess to a root of f.
% delta is a positive real number.
% fEvalsMax is a positive integer >= 2 that indicates the maximum
% number of f-evaluations allowed.
%
% Newton's method is repeatedly applied until the current iterate, xc,
% has the property that |f(xc)| <= delta. If that is not the case
% after fEvalsMax function evaluations, then xc is the current iterate.
%
% This routine computes the derivative of f at each iterate xc by
% using a central difference approximation with small perturbation size.
%
% fEvals is the number of f-evaluations required to obtain xc.


% Perturbation size
h = 10^-6;

% First Evaluation 
df_dx = (f(x0+h) - f(x0-h))/(2*h);
xc = x0 - f(x0)/df_dx;
fEvals = 1;

% Continue evaluation until conditions met
while abs(f(xc)) > delta && fEvals < fEvalMax
    df_dx = (f(xc+h) - f(xc-h))/(2*h);
    xc = xc - f(xc)/df_dx;
    fEvals = fEvals +1;
end
end
