function nova_slika = equihist(vhodna_slika)

h     = myhist(vhodna_slika, 256);
h_c   = cumsum(h);
h_nc  = h_c / max(h_c);
h_mnc = uint8(h_nc * 255);
nova_slika = (h_mnc(vhodna_slika + 1));

endfunction
