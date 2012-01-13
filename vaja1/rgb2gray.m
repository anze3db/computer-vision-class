function X = rgb2gray(A)
    A = double(A);
    A = (A(:,:,1) + A(:,:,2) + A(:,:,3))/3.0;
    X = uint8(A);
end
