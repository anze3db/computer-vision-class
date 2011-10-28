function [R, celice] = myhist(I, nbins)
[h,w] = size(I);
input_vektor = reshape(I, h*w, 1);
dolzina = length(input_vektor);
R = zeros(1, nbins);

max_val_in = 255 ; % najvi2ji sivinski nivo
min_val_in = 0 ; % najmanj2i sivinski nivo
% dolo£ite mejne vrednosti indeksov celic histograma
max_val_out = nbins ; % index najvi2je celice
min_val_out = 1 ; % index najnioje celice

i = 1 : dolzina;

% super fast:
input_vektor = val2binidx( input_vektor(i), max_val_in, min_val_in,max_val_out, min_val_out );
for i = 1 : length(R)
    R(i) = sum(input_vektor == i);
end

% normaliziraj histogram, da je vsot
R = R / sum(R) ;
% izra£unaj vhodno vrednost za celice histograma
idx = 1 : nbins ;
celice = binidx2val(idx, max_val_in, min_val_in, max_val_out, min_val_out) ;

%R(val2binidx(I(:), max_val_in, min_val_in, max_val_out, min_val_out)) = R(val2binidx(I(:), max_val_in, min_val_in, max_val_out, min_val_out));

   
endfunction
