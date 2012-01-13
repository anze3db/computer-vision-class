function idx = val2binidx(val, max_val_in, min_val_in, max_val_out, min_val_out)
% funkcija transformira vhodno vrednost v index
skalirni_faktor = (max_val_out - min_val_out) / (max_val_in - min_val_in) ;
idx =round(val*skalirni_faktor) + min_val_out ;

