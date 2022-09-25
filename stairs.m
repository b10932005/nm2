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

stairs_(test)

function ret = stairs_(in)
    for i = 1:length(in)
        h = in(i, 2);
        r = in(i, 3);
        % for (j = i + 1; j <= len(in) && in[j][0] < r; j++)
        j = i + 1;
        while j <= length(in) && in(j, 1) < r
            cur_l = in(j, 1);
            cur_h = in(j, 2);
            cur_r = in(j, 3);
            if h > cur_h
                in(j, 1) = r;
            else
                break_r = in(i, 3);
                % break segment into 2
                if break_r > cur_r
                    k = j + 1;
                    while k <= length(in) && in(k, 1) < cur_r
                        k = k + 1;
                    end
                    in = [in(1:k - 1, :); [cur_r h break_r]; in(k:end, :)];
                end
                in(i, 3) = cur_l;
                break
            end
            j = j + 1;
        end
    end

    % for (i = 0; i <= len(in); i++)
    i = 1;
    while i <= length(in)
        if in(i, 1) >= in(i, 3)
            in = [in(1:i - 1, :); in(i + 1:end, :)];
            i = i - 1;
        end
        i = i + 1;
    end

    ret = print_block(in);
end

function ret = print_block(stairs)
    hold on;
    points = [];
    ret = [];
    last_y = 0;
    for i = 1:length(stairs)
        x = stairs(i, 1);
        y = stairs(i, 2);
        points = [points; x last_y; x y];
        last_y = y;
        % enclose the polygon
        if i + 1 > length(stairs) || stairs(i, 3) ~= stairs(i + 1, 1)
            points = [points; stairs(i, 3) y; stairs(i, 3) 0];
            plot(polyshape(points));
            ret = [ret; points];
            points = [];
            last_y = 0;
        end
    end
end
