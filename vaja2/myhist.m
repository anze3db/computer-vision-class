function [R, celice] = myhist(I, nbins)
I = double(I);
[h,w] = size(I);
input_vektor = reshape(I, h*w, 1);
R = zeros(1, nbins);
max_val_in = 255; min_val_in = 0; % sivinski nivo
max_val_out = nbins; min_val_out = 0; % index celice

% super fast:
input_vektor = val2binidx(input_vektor(:), max_val_in, min_val_in,max_val_out, min_val_out);
for i = 1 : length(R)
    R(i) = sum(input_vektor == i);
end

idx = 1 : nbins;
celice = binidx2val(idx, max_val_in, min_val_in, max_val_out, min_val_out);
R = R ./ sum(R);

%R(val2binidx(I(:), max_val_in, min_val_in, max_val_out, min_val_out)) = R(val2binidx(I(:), max_val_in, min_val_in, max_val_out, min_val_out));
   
% Normalizacija:
   
endfunction
