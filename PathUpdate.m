function update = PathUpdate(z, path)
% PathUpdate function input vectors z and path and output new vector.
% The function updates the elements in the z vector based on the path
% value in the vector for path from 1 to the length of the path.


n = length(path);

% Change order by path number
for i=1:n
    update(i) = z(path(i));
end
end