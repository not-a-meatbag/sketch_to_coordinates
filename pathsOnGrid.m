function paths = pathsOnGrid(binary_img)

    temp_img = binary_img;
    
    paths = {};
    
    while ~binaryEmpty(temp_img)
        
        [start_row, start_col] = findStart(temp_img);
        new_path = [start_row ; start_col];
        temp_img(start_row,start_col) = 0;
        
        % assumes that all pixels of interest are sufficently far from the
        % edge of the image
        
        num_neighbours = hasNeighbours(new_path(1,end), new_path(2,end), temp_img);
        
        while num_neighbours ~= 0
            % if only has a single neighbour
            if num_neighbours == 1
                new_point = findSingleNeighbour(new_path(1,end), new_path(2,end), temp_img);
                new_path = [new_path new_point];
                num_neighbours = hasNeighbours(new_path(1,end), new_path(2,end), temp_img);
                temp_img(new_point(1),new_point(2)) = 0;
                
            else
                %if multiple neighbours then right now just pick random
                %neighbour
                new_point = findRandomNeighbour(new_path(1,end), new_path(2,end), temp_img);
                new_path = [new_path new_point];
                num_neighbours = hasNeighbours(new_path(1,end), new_path(2,end), temp_img);
                temp_img(new_point(1),new_point(2)) = 0;
            end
        end
        
        paths{end+1} = new_path;
        
    end


end


