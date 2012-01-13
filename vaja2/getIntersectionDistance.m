function d = getIntersectionDistance( h1, h2 )
    d = 1 - sum(min(h1(:),h2(:)));
end
