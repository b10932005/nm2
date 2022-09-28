clear;
close all;
format long;

test = [
    1, 11, 5;
    2, 6, 7;
    3, 13, 9;
    12, 7, 16;
    14, 3, 25;
    19, 18, 22;
    23, 13, 29;
    24, 4, 28;
    ];

print_block(test)

function ret = print_block(in)
    hold on;
    last_y = 0;
    last_x = 0;
    points = zeros(in(end, 3), 1);
    for i = 1:length(in)
        x_l = in(i, 1);
        y = in(i, 2);
        x_r = in(i, 3);
        if y > last_y
            points(x_l:x_r - 1) = y;
        elseif x_l > last_x
            points(x_l:x_r - 1) = y;
        elseif x_r > last_x
            points(last_x:x_r - 1) = y;
        end
        last_y = y;
        last_x = x_r;
    end
    points = [0; points; 0; 0];
    stairs((0:in(end, 3) + 2), points);
    ret = points;
end
