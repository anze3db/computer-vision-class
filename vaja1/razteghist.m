function nova_slika = razteghist(vhodna_slika)

vhodna_min = min(vhodna_slika(:));
vhodna_max = max(vhodna_slika(:));
k = 255 / (vhodna_max - vhodna_min);
nova_slika = (vhodna_slika - vhodna_min) .* k; 

endfunction
