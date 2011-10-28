function val = binidx2val(idx, max_val_in, min_val_in, max_val_out, min_val_out)
% funkcija transformira index v izhodno vrednost
skalirni_faktor = (max_val_out - min_val_out) ./ (max_val_in - min_val_in) ;
val = (idx - min_val_out)./skalirni_faktor ;

