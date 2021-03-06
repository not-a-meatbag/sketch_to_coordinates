function [row_index, column_index] = findStart(img)

    %search inward from the corners
    for i = 1:size(img,1)-1
        for j = 1:size(img,2)-1
            
            if img(i, j) == 1
                row_index = i;
                column_index = j;
                return
            end
            
            if img(size(img,1) - i, j) == 1
                row_index = size(img,1) - i;
                column_index = j;
                return
            end
            
            if img(i, size(img,2) - j) == 1
                row_index = i;
                column_index = size(img,2) - j;
                return
            end
            
            if img(size(img,1) - i, size(img,2) - j) == 1
                row_index = size(img,1) - i;
                column_index = size(img,2) - j;
                return
            end
            
        end
    end
end

